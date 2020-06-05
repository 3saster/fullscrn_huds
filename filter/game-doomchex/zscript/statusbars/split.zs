extend Class SpecialDoomStatusBar
{	
	void DrawSplit ()
	{
		double alphaFloat = 1-alphaValue.getfloat(); // Transparency
		
		int alphaO = alphaOpaque.GetInt();
		double alphaFloatNum = alphaO == OP_NUM || alphaO == OP_NUMGRAPH ? 1 : alphaFloat;
		double alphaFloatGraph = alphaO == OP_NUMGRAPH ? 1 : alphaFloat;
		
		// Draw left side
		DrawImage(addArms(HUD_LEFT), (71.5, 0), DI_SCREEN_LEFT_BOTTOM, alphaFloat);
		if(multiplayer) DrawImage("STFBANY", (107, -32), DI_SCREEN_LEFT_BOTTOM|DI_TRANSLATABLE|DI_ITEM_OFFSETS, alphaFloat);

		// Draw right side
		DrawImage(addArms(HUD_RIGHT), (-71.5, 0), DI_SCREEN_RIGHT_BOTTOM, alphaFloat);
		
		// Draw Percent Symbols
		int percentColor = GetPercentColor();
		DrawString(mHUDFontF, "%", (90+isChex(1), -29), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_TOP|DI_NOSHADOW, translation: percentColor, alpha:alphaFloatNum);
		DrawString(mHUDFontF, "%", (-99+isChex(2),-29), DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_TOP|DI_NOSHADOW, translation: percentColor, alpha:alphaFloatNum);
	
		// Draw Current Ammo Counter
		Inventory a1, a2;
		[a1,a2] = GetCurrentAmmo();
		if (a1 != null)
		{
			if(a2 == null || a1 == a2)
			{
				int ammoColor = GetAmmoColor(a1);
				DrawString(mHUDFontF, FormatNumber(a1.Amount, 3), (44+isChex(4), -29), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_LEFT_BOTTOM, translation: ammoColor, alpha:alphaFloatNum);
			}
			else
			{
				int ammoColor1 = GetAmmoColor(a1);
				int ammoColor2 = GetAmmoColor(a2);
				DrawString(mSmallFont, FormatNumber(a1.Amount, 3), (44+isChex(2.5), -29), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_LEFT_BOTTOM, translation: ammoColor1, alpha:alphaFloatNum);
				DrawString(mSmallFont, FormatNumber(a2.Amount, 3), (44+isChex(2.5), -20), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_LEFT_BOTTOM, translation: ammoColor2, alpha:alphaFloatNum);
			}
		}
		
		// Draw Health
		int healthColor = GetHealthColor();
		DrawString(mHUDFontF, FormatNumber(CPlayer.health, 3), (90+isChex(1), -29), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_LEFT_BOTTOM, translation: healthColor, alpha:alphaFloatNum);
		
		// Draw Armor
		int armorColor = GetArmorColor();
		DrawString(mHUDFontF, FormatNumber(GetArmorAmount(), 3), (-99+isChex(2), -29), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_RIGHT_BOTTOM, translation:armorColor, alpha:alphaFloatNum);

		// Draw Keys
		DrawSplitKeys(alphaFloatGraph);

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
						DrawString(mIndexFontF, FormatNumber(amt1,   3), (-32+isChex(5)+CURR_OFFSET, -27+6*i), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatNum);
						DrawString(mIndexFontF, FormatNumber(maxamt, 3), (-6+isChex(1)+MAX_OFFSET,   -27+6*i), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatNum);
						break;
					}			
				}
			}
		}
		
		// Draw Split Arms over face if CVAR is on
		if(splitArms.GetInt())
		{
			// HacX font is backwards if not on the display
			DrawImage(!isHacX() ^ CPlayer.HasWeaponsInSlot(2)? concat(STGNUM,"2") : concat(STYSNUM,"2"), (108+0*6+ARMS_OFFSET, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(!isHacX() ^ CPlayer.HasWeaponsInSlot(3)? concat(STGNUM,"3") : concat(STYSNUM,"3"), (108+1*6+ARMS_OFFSET, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(!isHacX() ^ CPlayer.HasWeaponsInSlot(4)? concat(STGNUM,"4") : concat(STYSNUM,"4"), (108+2*6+ARMS_OFFSET, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(!isHacX() ^ CPlayer.HasWeaponsInSlot(5)? concat(STGNUM,"5") : concat(STYSNUM,"5"), (108+3*6+ARMS_OFFSET, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(!isHacX() ^ CPlayer.HasWeaponsInSlot(6)? concat(STGNUM,"6") : concat(STYSNUM,"6"), (108+4*6+ARMS_OFFSET, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(!isHacX() ^ CPlayer.HasWeaponsInSlot(7)? concat(STGNUM,"7") : concat(STYSNUM,"7"), (108+5*6+ARMS_OFFSET, -38), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
		}
		
		
		// Draw Mugshot/Inventory (Overwrite Mugshot)
		if(invReplace.getInt())
		{
			if (CPlayer.mo.InvSel != null && !Level.NoInventoryBar)
			{
				drawBerserk(alphaFloatGraph,true); // Draw Under Inventory
				DrawInventoryIcon(CPlayer.mo.InvSel, (124+MUG_OFFSET, -16), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_CENTER, alpha:alphaFloatGraph);
				if (CPlayer.mo.InvSel.Amount > 1)
				{
					DrawString(mAmountFont, FormatNumber(CPlayer.mo.InvSel.Amount), (139+MUG_OFFSET, -2-mIndexFontF.mFont.GetHeight()), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_LEFT_BOTTOM, Font.CR_GOLD, alpha:alphaFloatNum);
				}
			}
			else
			{
				DrawTexture(GetMugShot(5), (107+isChex(1)+isHacX(1)+MUG_OFFSET, -32), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
				drawBerserk(alphaFloatGraph,true); // Draw Over Mugshot
			}
		}
		// Draw Mugshot/Inventory (Do Not Overwrite Mugshot)
		else
		{
			DrawTexture(GetMugShot(5), (107+isChex(1)+isHacX(1)+MUG_OFFSET, -32), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
			drawBerserk(alphaFloatGraph,true); // Draw Over Mugshot
			if (CPlayer.mo.InvSel != null && !Level.NoInventoryBar)
			{
				DrawInventoryIcon(CPlayer.mo.InvSel, (163, -16), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_CENTER, alpha:alphaFloatGraph);
				if (CPlayer.mo.InvSel.Amount > 1)
				{
					DrawString(mAmountFont, FormatNumber(CPlayer.mo.InvSel.Amount), (178, -2-mIndexFontF.mFont.GetHeight()), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_LEFT_BOTTOM, Font.CR_GOLD, alpha:alphaFloatNum);
				}
			}
		}

		// Draw Frags
		if (deathmatch || teamplay)
		{
			DrawString(mAmountFont, FormatNumber(CPlayer.FragCount, 3), (139, -30), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_LEFT_BOTTOM|DI_NOSHADOW, Font.CR_RED, alpha:alphaFloatNum);
		}
		
		// Compute how much space we have for the inventory bar
		Vector2 scale = GetHUDScale();
		int VirtualWidth  = int(Screen.GetWidth()/scale.x);
		
		let left =  TexMan.CheckForTexture(addArms(HUD_LEFT),  TexMan.Type_MiscPatch);
		let right = TexMan.CheckForTexture(addArms(HUD_RIGHT), TexMan.Type_MiscPatch);
		double textureWidth = 2*max(getTextureWidth(left),getTextureWidth(right))+2 + getTextureWidth(diparms_sbar.left) + getTextureWidth(diparms_sbar.right);
		
		int maxInv = int( (VirtualWidth - textureWidth)/diparms_sbar.boxsize.X );
		
		// Draw Inventory Bar
		if (isInventoryBarVisible())
		{
			int itemCount = 0;
			for(Inventory item = CPlayer.mo.FirstInv(); item != NULL && itemCount < maxInv; item = item.NextInv())
				itemCount++;
			DrawInventoryBarTrans(diparms_sbar, (0, -1), max(itemCount,1), DI_SCREEN_CENTER_BOTTOM, bgalpha:alphaFloat, fgalpha:alphaFloatGraph, numalpha: alphaFloatNum);
		}
	}

	void DrawSplitKeys(double alphaFloatGraph)
	{
		bool locks[6];
		String image;
		for(int i = 0; i < 6; i++) locks[i] = CPlayer.mo.CheckKeys(i + 1, false, true);
		// key 1
		if (locks[1] && locks[4]) image = "STKEYS6";
		else if (locks[1]) image = "STKEYS0";
		else if (locks[4]) image = "STKEYS3";
		DrawImage(image, (-81 + KEY_OFFSET, -29), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
		// key 2
		if (locks[2] && locks[5]) image = "STKEYS7";
		else if (locks[2]) image = "STKEYS1";
		else if (locks[5]) image = "STKEYS4";
		else image = "";
		DrawImage(image, (-81 + KEY_OFFSET, -19), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
		// key 3
		if (locks[0] && locks[3]) image = "STKEYS8";
		else if (locks[0]) image = "STKEYS2";
		else if (locks[3]) image = "STKEYS5";
		else image = "";
		DrawImage(image, (-81 + KEY_OFFSET, -9), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
		if( isCorTech() )
		{
			// Aqua Card
			if( CPlayer.mo.CheckKeys(8,false,true) )
				DrawImage("AQUA", (-70 + KEY_OFFSET, -29), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
			// Orange Card
			if( CPlayer.mo.CheckKeys(9,false,true) )
				DrawImage("EMBER", (-70 + KEY_OFFSET, -19), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
			// Silver Card
			if( CPlayer.mo.CheckKeys(10,false,true) )
				DrawImage("Silver", (-70 + KEY_OFFSET, -9), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
		}
	}
}