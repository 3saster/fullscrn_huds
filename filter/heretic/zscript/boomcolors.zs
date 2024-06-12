extend Class SpecialHereticStatusBar
{	
	// ================================================
	// Helper Functions for getting various font colors
	// ================================================
	int GetPercentColor()
	{
		return boomColors.getInt() ? Font.CR_WHITE : Font.CR_UNTRANSLATED;
	}
	
	int GetAmmoColor(Inventory a1)
	{
		int amt1   = a1.Amount;
		int maxamt = a1.MaxAmount;
		
		int ammoColor;
		if(boomColors.getInt())
		{
			if (amt1 <= maxamt/4)
				ammoColor = FONT.CR_RED;
			else if (amt1 <= maxamt/2)
				ammoColor = FONT.CR_UNTRANSLATED;
			else
				ammoColor = FONT.CR_GREEN;
		}
		else
			ammoColor = FONT.CR_UNTRANSLATED;
			
		return ammoColor;
	}
	
	int GetHealthColor()
	{
		int currHealth = CPlayer.Health;
		int maxHealth = CPlayer.mo.GetMaxHealth();
		
		int healthColor;
		if(boomColors.getInt())
		{
			if(currHealth <= maxHealth/4)
				healthColor = FONT.CR_RED;
			else if	(currHealth <= maxHealth/2)
				healthColor = FONT.CR_UNTRANSLATED;
			else if	(currHealth <= maxHealth)
				healthColor = FONT.CR_GREEN;
			else
				healthColor = FONT.CR_BLUE;
		}
		else
			healthColor = FONT.CR_UNTRANSLATED;
			
		return healthColor;	
	}
	
	int GetArmorColor()
	{
		int currArmor = GetArmorSavePercent();
		
		int armorColor;
		if(boomColors.getInt())
		{
			if (currArmor >= gameinfo.Armor2Percent*100)
				armorColor = FONT.CR_BLUE;
			else if (currArmor > 0)
				armorColor = FONT.CR_GREEN;
			else
				armorColor = FONT.CR_RED;
		}
		else
			armorColor = FONT.CR_UNTRANSLATED;
			
		return armorColor;
	}
}