extend Class SpecialHexenStatusBar
{
	// ================================================
	// Helper Functions for getting various font colors
	// ================================================
	int GetPercentColor()
	{
		return boomColors.getInt() ? Font.CR_WHITE : Font.CR_UNTRANSLATED;
	}
	
	int GetAmmoColor(Inventory a1, int curr = 0, int max = 0)
	{
		int amt1   = (a1 != NULL) ? a1.Amount : curr;
		int maxamt = (a1 != NULL) ? a1.MaxAmount : max;
		
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
			if (currHealth <= maxHealth/4)
				healthColor = FONT.CR_RED;
			else if	(currHealth <= maxHealth/2)
				healthColor = FONT.CR_UNTRANSLATED;
			else if	(currHealth <= maxHealth)
				healthColor = FONT.CR_GREEN;
			else
				healthColor = FONT.CR_LIGHTBLUE;
		}
		else
			healthColor = CPlayer.Health < 25? Font.CR_RED : Font.CR_UNTRANSLATED;
			
		return healthColor;	
	}
	
	int GetArmorColor()
	{
		double currArmor = GetArmorSavePercent();
		
		let player = CPlayer.mo;
		double minArmor = player.HexenArmor[0];
		double maxArmor = player.HexenArmor[0]+player.HexenArmor[1]+player.HexenArmor[2]+player.HexenArmor[3]+player.HexenArmor[4];
		
		int armorColor;
		// Red = Minimum armor; Green = More than min, less than halfway to max armor; Lightblue = More than halfway to max armor; Purple: Possible with Dragonskin Bracers
		if(boomColors.getInt())
		{
			if (currArmor > maxArmor)
				armorColor = FONT.CR_PURPLE;
			else if	(currArmor >= (maxArmor+minArmor)/2)
				armorColor = FONT.CR_LIGHTBLUE;
			else if (currArmor > minArmor)
				armorColor = FONT.CR_GREEN;
			else
				armorColor = FONT.CR_RED;
		}
		else
			armorColor = FONT.CR_UNTRANSLATED;
			
		return armorColor;
	}
}