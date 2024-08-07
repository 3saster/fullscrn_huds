extend Class SpecialHereticStatusBar
{	
	void DrawSplit ()
	{
		double alphaFloat = 1-alphaValue.getfloat(); // Transparency
		
		int alphaO = alphaOpaque.GetInt();
		double alphaFloatNum = alphaO == OP_NUM || alphaO == OP_NUMGRAPH ? 1 : alphaFloat;
		double alphaFloatGraph = alphaO == OP_NUMGRAPH ? 1 : alphaFloat;

		// Draw left side
		string barLeft;
		if(deathmatch || teamplay)
			barLeft = isInvulnerable() ? "BAR_INV2" : "BAR_KILL";
		else
			barLeft = isInvulnerable() ? "BAR_INV1" : "BAR_LEFT";

		DrawImage(barLeft, (1, -1), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_LEFT_BOTTOM, alphaFloat);
			
		// Draw right side
		DrawImage("BAR_RGHT", (-1, -1), DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_RIGHT_BOTTOM, alphaFloat);
		
		// Draw Current Ammo Counter
		Inventory a1,a2;
		[a1,a2] = GetCurrentAmmo();
		if (a1 != null)
		{
			if(a2 == null || a1 == a2)
			{
				int ammoColor = GetAmmoColor(a1);
				DrawString(mHUDFont, FormatNumber(a1.Amount, 3), (-51, -29), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_RIGHT_BOTTOM, translation: ammoColor, alpha:alphaFloatNum);
				DrawTexture(a1.icon, (-64, -11), DI_ITEM_CENTER|DI_SCREEN_RIGHT_BOTTOM, alphaFloatNum);
			}
			else
			{
				int ammoColor1 = GetAmmoColor(a1);
				int ammoColor2 = GetAmmoColor(a2);
				DrawString(mIndexFont, FormatNumber(a1.Amount, 3), (-50, -26), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM, translation: ammoColor1, alpha:alphaFloatNum);
				DrawString(mIndexFont, FormatNumber(a2.Amount, 3), (-50, -14), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM, translation: ammoColor2, alpha:alphaFloatNum);
				DrawTexture(a1.icon, (-72, -22), DI_ITEM_CENTER|DI_SCREEN_RIGHT_BOTTOM, alphaFloatNum);
				DrawTexture(a2.icon, (-72, -11), DI_ITEM_CENTER|DI_SCREEN_RIGHT_BOTTOM, alphaFloatNum);
			}
		}
		
		// Draw Health
		int healthColor = GetHealthColor();
		DrawString(mHUDFont, FormatNumber(mHealthInterpolator.GetValue()), (36, -18), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_LEFT_BOTTOM, translation: healthColor, alpha:alphaFloatNum);
		
		// Draw Armor
		int armorColor = GetArmorColor();
		DrawString(mHUDFont, FormatNumber(GetArmorAmount(), 3), (87, -18), DI_TEXT_ALIGN_RIGHT|DI_NOSHADOW|DI_SCREEN_LEFT_BOTTOM, translation:armorColor, alpha:alphaFloatNum);
		
		// Draw Keys
		if (CPlayer.mo.CheckKeys(1, false, true))
			DrawImage("GKEYICON", (-105, -19), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
		else
			DrawImage("NOKEY", (-105, -19), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alphaFloat);
		if (CPlayer.mo.CheckKeys(2, false, true))
			DrawImage("BKEYICON", (-105, -11), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
		else 
			DrawImage("NOKEY", (-105, -11), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alphaFloat);
		if (CPlayer.mo.CheckKeys(3, false, true))
			DrawImage("YKEYICON", (-105, -27), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
		else 
			DrawImage("NOKEY", (-105, -27), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alphaFloat);
		
		// Draw Frags + Color
		if(multiplayer)
		{
			if (deathmatch || teamplay)
			{
				DrawString(mHUDFont, FormatNumber(CPlayer.FragCount, 3), (138, -18), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_LEFT_BOTTOM|DI_NOSHADOW, alpha:alphaFloatNum);
				DrawImage("DM_COL", (1, -1), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_LEFT_BOTTOM|DI_TRANSLATABLE, alphaFloat);
			}
			else
				DrawImage("COOP_COL", (1, -1), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_LEFT_BOTTOM|DI_TRANSLATABLE, alphaFloat);
		}

		// Draw Split Arms over ammo display if CVAR is on
		if(splitArms.GetInt())
		{
			DrawImage(CPlayer.HasWeaponsInSlot(2)? concat(SMALLIN,"2") : concat(SMALLGR,"2"), (-81+0*6, -38), DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(CPlayer.HasWeaponsInSlot(3)? concat(SMALLIN,"3") : concat(SMALLGR,"3"), (-81+1*6, -38), DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(CPlayer.HasWeaponsInSlot(4)? concat(SMALLIN,"4") : concat(SMALLGR,"4"), (-81+2*6, -38), DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(CPlayer.HasWeaponsInSlot(5)? concat(SMALLIN,"5") : concat(SMALLGR,"5"), (-81+3*6, -38), DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(CPlayer.HasWeaponsInSlot(6)? concat(SMALLIN,"6") : concat(SMALLGR,"6"), (-81+4*6, -38), DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(CPlayer.HasWeaponsInSlot(7)? concat(SMALLIN,"7") : concat(SMALLGR,"7"), (-81+5*6, -38), DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
		}

		// Draw Inventory
		if (CPlayer.mo.InvSel != null && !Level.NoInventoryBar)
		{
			DrawInventoryIcon(CPlayer.mo.InvSel, (-19, -16), DI_ITEM_CENTER|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
			if (CPlayer.mo.InvSel.Amount > 1)
				DrawString(mIndexFont, FormatNumber(CPlayer.mo.InvSel.Amount), (-4, -3-mIndexFont.mFont.GetHeight()), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_RIGHT_BOTTOM, Font.CR_UNTRANSLATED, alpha:alphaFloatNum);
		}
		
		// Compute how much space we have for the inventory bar
		Vector2 scale = GetHUDScale();
		int VirtualWidth  = int(Screen.GetWidth()/scale.x);
		
		let left =  TexMan.CheckForTexture(barLeft,    TexMan.Type_MiscPatch);
		let right = TexMan.CheckForTexture("BAR_RGHT", TexMan.Type_MiscPatch);
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
}