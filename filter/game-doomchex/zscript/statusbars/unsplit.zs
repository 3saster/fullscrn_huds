extend Class SpecialDoomStatusBar
{	
	void DrawUnsplit ()
	{
		double alphaFloat = 1-alphaValue.getfloat(); // Transparency
		
		int alphaO = alphaOpaque.GetInt();
		double alphaFloatNum = alphaO == OP_NUM || alphaO == OP_NUMGRAPH ? 1 : alphaFloat;
		double alphaFloatGraph = alphaO == OP_NUMGRAPH ? 1 : alphaFloat;
		
		// Draw Main STBAR Chunk
		if(deathmatch || teamplay)
			DrawImage(addArms(HUD_DM), (0, 0), DI_SCREEN_CENTER_BOTTOM, alphaFloat);
		else
			DrawImage(addArms(HUD_SMP), (0, 0), DI_SCREEN_CENTER_BOTTOM, alphaFloat);
		if(multiplayer)
			DrawImage("STFBANY", (-17, -32), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS|DI_TRANSLATABLE, alphaFloat);
		
		// Draw Percent Symbols
		int percentColor = GetPercentColor();
		DrawString(mHUDFont, "%", (-70+isChex(1), -29), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_TOP|DI_NOSHADOW, translation: percentColor, alpha:alphaFloatNum);
		DrawString(mHUDFont, "%", (61+isChex(2),  -29), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_TOP|DI_NOSHADOW, translation: percentColor, alpha:alphaFloatNum);
		
		// Draw Current Ammo Counter
		Inventory a1, a2;
		[a1,a2] = GetCurrentAmmo();
		if (a1 != null)
		{
			if(a2 == null || a1 == a2)
			{
				int ammoColor = GetAmmoColor(a1);
				DrawString(mHUDFont, FormatNumber(a1.Amount, 3), (-116+isChex(4), -29), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_CENTER_BOTTOM, translation: ammoColor, alpha:alphaFloatNum);
			}
			else
			{
				int ammoColor1 = GetAmmoColor(a1);
				int ammoColor2 = GetAmmoColor(a2);
				DrawString(mSmallFont, FormatNumber(a1.Amount, 3), (-116+isChex(2.5), -29), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, translation: ammoColor1, alpha:alphaFloatNum);
				DrawString(mSmallFont, FormatNumber(a2.Amount, 3), (-116+isChex(2.5), -20), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, translation: ammoColor2, alpha:alphaFloatNum);
			}
		}
		
		// Draw Health
		int healthColor = GetHealthColor();
		DrawString(mHUDFont, FormatNumber(CPlayer.health, 3), (-70+isChex(1), -29), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_CENTER_BOTTOM, translation: healthColor, alpha:alphaFloatNum);
		
		// Draw Armor
		int armorColor = GetArmorColor();
		DrawString(mHUDFont, FormatNumber(GetArmorAmount(), 3), (61+isChex(2), -29), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_CENTER_BOTTOM, translation:armorColor, alpha:alphaFloatNum);

		// Draw Keys
		bool locks[6];
		String image;
		for(int i = 0; i < 6; i++) locks[i] = CPlayer.mo.CheckKeys(i + 1, false, true);
		//  key 1
		if (locks[1] && locks[4]) image = "STKEYS6";
		else if (locks[1]) image = "STKEYS0";
		else if (locks[4]) image = "STKEYS3";
		DrawImage(image, (79, -29), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
		//  key 2
		if (locks[2] && locks[5]) image = "STKEYS7";
		else if (locks[2]) image = "STKEYS1";
		else if (locks[5]) image = "STKEYS4";
		else image = "";
		DrawImage(image, (79, -19), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
		//  key 3
		if (locks[0] && locks[3]) image = "STKEYS8";
		else if (locks[0]) image = "STKEYS2";
		else if (locks[3]) image = "STKEYS5";
		else image = "";
		DrawImage(image, (79, -9), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
		
		// Draw Total Ammo Count
		int amt1, maxamt;
		
		if(!chexArms || chexArms.getInt())
		{
			for(int i = 0; i < ammoNames.size(); i++)
			{
				for(int j = 0; j < AllActorClasses.Size(); j++)
				{
					if(AllActorClasses[j] is ammoNames[i])
					{
						let ammotype = (class<Ammo>)(AllActorClasses[j]);
						[amt1, maxamt] = GetAmount(ammotype);
						DrawString(mIndexFontF, FormatNumber(amt1,   3), (128+isChex(5), -27+6*i), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatNum);
						DrawString(mIndexFontF, FormatNumber(maxamt, 3), (154+isChex(1), -27+6*i), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatNum);
						break;
					}			
				}
			}
		}
		
		// Draw Frags
		if (deathmatch || teamplay)
		{
			DrawString(mHUDFont, FormatNumber(CPlayer.FragCount, 3), (-22+isChex(3), -29), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM|DI_NOSHADOW, alpha:alphaFloatNum);
		}
		// Draw Arms
		else if(!chexArms || chexArms.getInt())
		{
			DrawImage(CPlayer.HasWeaponsInSlot(2)? concat(STYSNUM,"2") : concat(STGNUM,"2"), (-49, -28), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(CPlayer.HasWeaponsInSlot(3)? concat(STYSNUM,"3") : concat(STGNUM,"3"), (-37, -28), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(CPlayer.HasWeaponsInSlot(4)? concat(STYSNUM,"4") : concat(STGNUM,"4"), (-25, -28), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(CPlayer.HasWeaponsInSlot(5)? concat(STYSNUM,"5") : concat(STGNUM,"5"), (-49, -18), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(CPlayer.HasWeaponsInSlot(6)? concat(STYSNUM,"6") : concat(STGNUM,"6"), (-37, -18), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(CPlayer.HasWeaponsInSlot(7)? concat(STYSNUM,"7") : concat(STGNUM,"7"), (-25, -18), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
		}
		
		// Draw Mugshot/Inventory (Overwrite Mugshot)
		if(invReplace.getInt())
		{
			if (CPlayer.mo.InvSel != null && !Level.NoInventoryBar)
			{
				drawBerserk(alphaFloatGraph); // Draw Under Inventory
				DrawInventoryIcon(CPlayer.mo.InvSel, (0, -16), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_CENTER, alpha:alphaFloatGraph);
				if (CPlayer.mo.InvSel.Amount > 1)
				{
					DrawString(mAmountFont, FormatNumber(CPlayer.mo.InvSel.Amount), (15, -2-mIndexFontF.mFont.GetHeight()), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, Font.CR_GOLD, alpha:alphaFloatNum);
				}
			}
			else
			{
				DrawTexture(GetMugShot(5), (-17+isChex(1), -32), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
				drawBerserk(alphaFloatGraph); // Draw Over Mugshot
			}
		}
		// Draw Mugshot/Inventory (Do Not Overwrite Mugshot)
		else
		{
			DrawTexture(GetMugShot(5), (-17+isChex(1), -32), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
			drawBerserk(alphaFloatGraph); // Draw Over Mugshot
			if (CPlayer.mo.InvSel != null && !Level.NoInventoryBar)
			{
				DrawInventoryIcon(CPlayer.mo.InvSel, (180, -16), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_CENTER, alpha:alphaFloatGraph);
				if (CPlayer.mo.InvSel.Amount > 1)
				{
					DrawString(mAmountFont, FormatNumber(CPlayer.mo.InvSel.Amount), (195, -2-mIndexFontF.mFont.GetHeight()), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, Font.CR_GOLD, alpha:alphaFloatNum);
				}
			}
		}
		
		// Draw Inventory Bar
		if (isInventoryBarVisible())
		{
			int itemCount = 0;
			for(Inventory item = CPlayer.mo.InvFirst; item != NULL && itemCount < 7; item = item.NextInv())
				itemCount++;
			DrawInventoryBarTrans(diparms_sbar, (0, -33), max(itemCount,1), DI_SCREEN_CENTER_BOTTOM, bgalpha:alphaFloat, fgalpha:alphaFloatGraph, numalpha:alphaFloatNum);
		}
	}
}