extend Class SpecialDoomStatusBar
{	
	void DrawSplit ()
	{
		double alphaFloat = 1-alphaValue.getfloat(); // Transparency
		
		int alphaO = alphaOpaque.GetInt();
		double alphaFloatNum = alphaO == OP_NUM || alphaO == OP_NUMGRAPH ? 1 : alphaFloat;
		double alphaFloatGraph = alphaO == OP_NUMGRAPH ? 1 : alphaFloat;
		
		// Draw left side
		DrawImage(addArms("HUD_LEFT"), (71.5, 0), DI_SCREEN_LEFT_BOTTOM, alphaFloat);
		if(multiplayer) DrawImage("STFBANY", (107, -32), DI_SCREEN_LEFT_BOTTOM|DI_TRANSLATABLE|DI_ITEM_OFFSETS, alphaFloat);

		// Draw right side
		DrawImage(addArms("HUD_RIGHT"), (-71.5, 0), DI_SCREEN_RIGHT_BOTTOM, alphaFloat);
		
		// Draw Percent Symbols
		int percentColor = GetPercentColor();
		DrawString(mHUDFont, "%", (90+isChex(1), -29), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_TOP|DI_NOSHADOW, translation: percentColor, alpha:alphaFloatNum);
		DrawString(mHUDFont, "%", (-99+isChex(2),-29), DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_TOP|DI_NOSHADOW, translation: percentColor, alpha:alphaFloatNum);
	
		// Draw Current Ammo Counter
		Inventory a1 = GetCurrentAmmo();
		if (a1 != null)
		{
			int ammoColor = GetAmmoColor(a1);
			DrawString(mHUDFont, FormatNumber(a1.Amount, 3), (44+isChex(4), -29), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_LEFT_BOTTOM, translation: ammoColor, alpha:alphaFloatNum);
		}
		
		// Draw Health
		int healthColor = GetHealthColor();
		DrawString(mHUDFont, FormatNumber(CPlayer.health, 3), (90+isChex(1), -29), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_LEFT_BOTTOM, translation: healthColor, alpha:alphaFloatNum);
		
		// Draw Armor
		int armorColor = GetArmorColor();
		DrawString(mHUDFont, FormatNumber(GetArmorAmount(), 3), (-99+isChex(2), -29), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_RIGHT_BOTTOM, translation:armorColor, alpha:alphaFloatNum);

		// Draw Keys
		bool locks[6];
		String image;
		for(int i = 0; i < 6; i++) locks[i] = CPlayer.mo.CheckKeys(i + 1, false, true);
		// key 1
		if (locks[1] && locks[4]) image = "STKEYS6";
		else if (locks[1]) image = "STKEYS0";
		else if (locks[4]) image = "STKEYS3";
		DrawImage(image, (-81, -29), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
		// key 2
		if (locks[2] && locks[5]) image = "STKEYS7";
		else if (locks[2]) image = "STKEYS1";
		else if (locks[5]) image = "STKEYS4";
		else image = "";
		DrawImage(image, (-81, -19), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
		// key 3
		if (locks[0] && locks[3]) image = "STKEYS8";
		else if (locks[0]) image = "STKEYS2";
		else if (locks[3]) image = "STKEYS5";
		else image = "";
		DrawImage(image, (-81, -9), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);

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
						DrawString(mIndexFontF, FormatNumber(amt1,   3), (-32+isChex(5), -27+6*i), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatNum);
						DrawString(mIndexFontF, FormatNumber(maxamt, 3), (-6+isChex(1), -27+6*i), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatNum);
						break;
					}			
				}
			}
		}
		
		// Draw Split Arms over face if CVAR is on
		if(splitArms.GetInt())
		{
			if(!isHacX())
			{
				DrawImage(CPlayer.HasWeaponsInSlot(2)? chexName("STYSNUM2") : chexName("STGNUM2"), (108+0*6, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
				DrawImage(CPlayer.HasWeaponsInSlot(3)? chexName("STYSNUM3") : chexName("STGNUM3"), (108+1*6, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
				DrawImage(CPlayer.HasWeaponsInSlot(4)? chexName("STYSNUM4") : chexName("STGNUM4"), (108+2*6, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
				DrawImage(CPlayer.HasWeaponsInSlot(5)? chexName("STYSNUM5") : chexName("STGNUM5"), (108+3*6, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
				DrawImage(CPlayer.HasWeaponsInSlot(6)? chexName("STYSNUM6") : chexName("STGNUM6"), (108+4*6, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
				DrawImage(CPlayer.HasWeaponsInSlot(7)? chexName("STYSNUM7") : chexName("STGNUM7"), (108+5*6, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			}
			else // HacX font is backwards if not on the display
			{
				DrawImage(CPlayer.HasWeaponsInSlot(2)? chexName("STGNUM2") : chexName("STYSNUM2"), (108+0*6, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
				DrawImage(CPlayer.HasWeaponsInSlot(3)? chexName("STGNUM3") : chexName("STYSNUM3"), (108+1*6, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
				DrawImage(CPlayer.HasWeaponsInSlot(4)? chexName("STGNUM4") : chexName("STYSNUM4"), (108+2*6, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
				DrawImage(CPlayer.HasWeaponsInSlot(5)? chexName("STGNUM5") : chexName("STYSNUM5"), (108+3*6, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
				DrawImage(CPlayer.HasWeaponsInSlot(6)? chexName("STGNUM6") : chexName("STYSNUM6"), (108+4*6, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
				DrawImage(CPlayer.HasWeaponsInSlot(7)? chexName("STGNUM7") : chexName("STYSNUM7"), (108+5*6, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			}
		}
		
		
		// Draw Mugshot/Inventory (Overwrite Mugshot)
		if(invReplace.getInt())
		{
			if (CPlayer.mo.InvSel != null && !Level.NoInventoryBar)
			{
				drawBerserk(alphaFloatGraph,true); // Draw Under Inventory
				DrawInventoryIcon(CPlayer.mo.InvSel, (124, -16), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_CENTER, alpha:alphaFloatGraph);
				if (CPlayer.mo.InvSel.Amount > 1)
				{
					DrawString(mAmountFont, FormatNumber(CPlayer.mo.InvSel.Amount), (133, -2-mIndexFontF.mFont.GetHeight()), DI_SCREEN_LEFT_BOTTOM, Font.CR_GOLD, alpha:alphaFloatNum);
				}
			}
			else
			{
				DrawTexture(GetMugShot(5), (107+isChex(1)+isHacX(1), -32), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
				drawBerserk(alphaFloatGraph,true); // Draw Over Mugshot
			}
		}
		// Draw Mugshot/Inventory (Do Not Overwrite Mugshot)
		else
		{
			DrawTexture(GetMugShot(5), (107+isChex(1)+isHacX(1), -32), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
			drawBerserk(alphaFloatGraph,true); // Draw Over Mugshot
			if (CPlayer.mo.InvSel != null && !Level.NoInventoryBar)
			{
				DrawInventoryIcon(CPlayer.mo.InvSel, (163, -16), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_CENTER, alpha:alphaFloatGraph);
				if (CPlayer.mo.InvSel.Amount > 1)
				{
					DrawString(mAmountFont, FormatNumber(CPlayer.mo.InvSel.Amount), (172, -2-mIndexFontF.mFont.GetHeight()), DI_SCREEN_LEFT_BOTTOM, Font.CR_GOLD, alpha:alphaFloatNum);
				}
			}
		}

		// Draw Frags
		if (deathmatch || teamplay)
		{
			DrawString(mAmountFont, FormatNumber(CPlayer.FragCount, 3), (139, -30), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_LEFT_BOTTOM|DI_NOSHADOW, Font.CR_RED, alpha:alphaFloatNum);
		}
		
		// Draw Inventory Bar
		if (isInventoryBarVisible())
		{
			int itemCount = 0;
			for(Inventory item = CPlayer.mo.InvFirst; item != NULL && itemCount < 4; item = item.NextInv())
				itemCount++;
			DrawInventoryBarTrans(diparms_sbar, (0, -1), max(itemCount,1), DI_SCREEN_CENTER_BOTTOM, bgalpha:alphaFloat, fgalpha:alphaFloatGraph, numalpha: alphaFloatNum);
		}
	}
}