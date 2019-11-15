extend Class SpecialHereticStatusBar
{
	void DrawUnsplit ()
	{
		double alphaFloat = 1-alphaValue.getfloat(); // Transparency
		
		int alphaO = alphaOpaque.GetInt();
		double alphaFloatNum = alphaO == OP_NUM || alphaO == OP_NUMGRAPH ? 1 : alphaFloat;
		double alphaFloatGraph = alphaO == OP_NUMGRAPH ? 1 : alphaFloat;
		
		float offset = 0; // Set to -2.5 to match Heretic's standard HUD
		
		// Draw Main STBAR Chunk
		DrawImage("BARBACK", (-157.5+offset, -42), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS,alphaFloat);
		DrawImage("LTFCTOP", (-157.5+offset, -52), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS,alphaFloat);
		DrawImage("RTFCTOP", ( 132.5+offset, -52), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS,alphaFloat);
		if (isInvulnerable())
		{
			// god mode
			DrawImage("GOD1", (-141.5+offset, -33), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS,alphaFloat);
			DrawImage("GOD2", ( 129.5+offset, -33), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS,alphaFloat);
		}

		// Draw Lifebar or inventory bar
		if(!isInventoryBarVisible())
		{	
			// Draw Frags
			if(deathmatch || teamplay)
			{
				DrawImage("STATBAR",  (-123.4+offset, -40), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS,alphaFloat);
				// DrawImage("ARMCLEAR", (-100.5+offset, -29), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS,alphaFloat);
				DrawString(mHUDFont, FormatNumber(CPlayer.FragCount, 3), (-69.5+offset, -30), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM|DI_NOSHADOW, alpha:alphaFloatNum);
			}
			// Draw Health
			else
			{
				DrawImage("LIFEBAR",  (-123.4+offset, -40), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS,alphaFloat);
				// DrawImage("ARMCLEAR", (-100.5+offset, -29), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS,alphaFloat);
				int healthColor = GetHealthColor();
				DrawString(mHUDFont, FormatNumber(mHealthInterpolator.GetValue(), 3), (-69.5+offset, -30), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM|DI_NOSHADOW, translation:healthColor, alpha:alphaFloatNum);
			}
			
			// Draw Current Ammo Counter
			Inventory a1,a2;
			[a1,a2] = GetCurrentAmmo();
			if (a1 != null)
			{
				if(a2 == null)
				{
					int ammoColor = GetAmmoColor(a1);
					DrawString(mHUDFont, FormatNumber(a1.Amount, 3), (-21.5+offset, -38), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_CENTER_BOTTOM, translation: ammoColor, alpha:alphaFloatNum);
					DrawTexture(a1.icon, (-34.5+offset, -20), DI_ITEM_CENTER|DI_SCREEN_CENTER_BOTTOM, alphaFloatNum);
				}
				else
				{
					int ammoColor1 = GetAmmoColor(a1);
					int ammoColor2 = GetAmmoColor(a2);
					DrawString(mIndexFont, FormatNumber(a1.Amount, 3), (-20.5+offset, -35), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, translation: ammoColor1, alpha:alphaFloatNum);
					DrawString(mIndexFont, FormatNumber(a2.Amount, 3), (-20.5+offset, -23), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, translation: ammoColor2, alpha:alphaFloatNum);
					DrawTexture(a1.icon, (-42.5+offset, -31), DI_ITEM_CENTER|DI_SCREEN_CENTER_BOTTOM, alphaFloatNum);
					DrawTexture(a2.icon, (-42.5+offset, -20), DI_ITEM_CENTER|DI_SCREEN_CENTER_BOTTOM, alphaFloatNum);
				}
			}
			
			// Draw Armor
			int armorColor = GetArmorColor();
			DrawString(mHUDFont, FormatNumber(GetArmorAmount(), 3), (97.5+offset, -30), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_CENTER_BOTTOM, translation:armorColor, alpha:alphaFloatNum);
			
			// Draw Keys
			if (CPlayer.mo.CheckKeys(3, false, true)) DrawImage("YKEYICON", (-4.5+offset, -36), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
			if (CPlayer.mo.CheckKeys(1, false, true)) DrawImage("GKEYICON", (-4.5+offset, -28), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
			if (CPlayer.mo.CheckKeys(2, false, true)) DrawImage("BKEYICON", (-4.5+offset, -20), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
			
			// Draw Inventory
			if (CPlayer.mo.InvSel != null && !Level.NoInventoryBar)
			{
				DrawInventoryIcon(CPlayer.mo.InvSel, (36.5+offset, -25), DI_ITEM_CENTER|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
				if (CPlayer.mo.InvSel.Amount > 1)
				{
					DrawString(mIndexFont, FormatNumber(CPlayer.mo.InvSel.Amount), (51.5+offset, -12-mIndexFont.mFont.GetHeight()), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, Font.CR_UNTRANSLATED, alpha:alphaFloatNum);
				}
			}
		}
		else
		{
			DrawImage("INVBAR", (-123.4+offset, -40), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS,alphaFloat);
			DrawInventoryBarTrans(diparms_sbar, (0+offset, -9), 7, DI_SCREEN_CENTER_BOTTOM, bgalpha:alphaFloat, fgalpha:alphaFloatGraph, numalpha: alphaFloatNum);
		}
		
		// Draw Health Chain
		// DrawImage("CHAINBAC", (2.5+offset, 0), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_CENTER_BOTTOM, alphaFloat);
		// wiggle the chain if it moves
		int inthealth =  mHealthInterpolator.GetValue();
		DrawGemTrans("CHAIN", "LIFEGEM2",inthealth, CPlayer.mo.GetMaxHealth(true), (-7.5+offset, -1 + chainWig), 15, 25, 16, (multiplayer? DI_TRANSLATABLE : 0) | DI_ITEM_CENTER_BOTTOM | DI_SCREEN_CENTER_BOTTOM,alphaFloat);
		DrawImage("LTFACE", (-157.5+offset, -10), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloat);
		DrawImage("RTFACE", (118.6+offset, -10), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloat);
		DrawShader(SHADER_HORZ, (-138.5+offset, -10), (16, 10), DI_SCREEN_CENTER_BOTTOM, alphaFloat);
		DrawShader(SHADER_HORZ|SHADER_REVERSE, (120.5+offset, -10), (16, 10), DI_SCREEN_CENTER_BOTTOM, alphaFloat);
	}
}