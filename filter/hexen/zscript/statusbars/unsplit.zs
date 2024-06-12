extend Class SpecialHexenStatusBar
{
	void DrawUnsplit ()
	{
		double alphaFloat = 1-alphaValue.getfloat(); // Transparency
		
		int alphaO = alphaOpaque.GetInt();
		double alphaFloatNum = alphaO == OP_NUM || alphaO == OP_NUMGRAPH ? 1 : alphaFloat;
		double alphaFloatGraph = alphaO == OP_NUMGRAPH ? 1 : alphaFloat;
		
		// Draw Main STBAR Chunk
		DrawImage("H2BAR", (-160, -66), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS,alphaFloat);

		// Draw Health Gem
		String Gem, Chain;
		if (CPlayer.mo is "ClericPlayer")
			Gem = "LIFEGMC2"; Chain = "CHAIN2";
		else if (CPlayer.mo is "MagePlayer")
			Gem = "LIFEGMM2"; Chain = "CHAIN3";
		else
			Gem = "LIFEGMF2"; Chain = "CHAIN";

		int inthealth =  mHealthInterpolator2.GetValue();
		DrawGemTrans(Chain, Gem, inthealth, CPlayer.mo.GetMaxHealth(true), (-7, 0), -23, 49, 15, (multiplayer? DI_TRANSLATABLE : 0) | DI_ITEM_CENTER_BOTTOM | DI_SCREEN_CENTER_BOTTOM, alphaFloat); 
		
		DrawImage("LFEDGE", (-160, -7), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloat);
		DrawImage("RTEDGE", ( 117, -7), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloat);
		
		// Draw Inventory Bar
		if (isInventoryBarVisible())
		{
			DrawImage("INVBAR", (-122, -38), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloat);
			DrawInventoryBarTrans(diparms_sbar, (0.5, -6), 7, DI_SCREEN_CENTER_BOTTOM, bgalpha:alphaFloat, fgalpha:alphaFloatGraph, numalpha: alphaFloatNum);
		}
		else
		{
			// Draw Frags
			if (deathmatch || teamplay)
			{
				DrawImage("KILLBAR", (-122, -38), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloat);
				DrawString(mHUDFont, FormatNumber(CPlayer.FragCount, 3), (-94, -24), DI_SCREEN_CENTER_BOTTOM|DI_TEXT_ALIGN_RIGHT, alpha:alphaFloatNum);
			}
			// Draw Health
			else
			{
				DrawImage("STATBAR", (-122, -38), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloat);
				// Unnecessary, and GZDoom seems to draw this in the wrong spot...
				// DrawImage("ARMCLS", (-119, -22), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloat);
				int healthColor = getHealthColor();
				DrawString(mHUDFont, FormatNumber(mHealthInterpolator.GetValue(), 3), (-94, -24), DI_SCREEN_CENTER_BOTTOM|DI_TEXT_ALIGN_RIGHT, healthColor, alpha:alphaFloatNum);
			}
			
			// Draw Inventory
			if (CPlayer.mo.InvSel != null)
			{
				DrawInventoryIcon(CPlayer.mo.InvSel, (-0.5, -23), DI_ARTIFLASH|DI_ITEM_CENTER|DI_SCREEN_CENTER_BOTTOM,alpha:alphaFloatGraph, boxsize:(28, 28));
				if (CPlayer.mo.InvSel.Amount > 1)
					DrawString(mIndexFont, FormatNumber(CPlayer.mo.InvSel.Amount, 3), (14, -16), DI_SCREEN_CENTER_BOTTOM|DI_TEXT_ALIGN_RIGHT, Font.CR_UNTRANSLATED, alpha:alphaFloatNum);
			}
			
			// Draw Armor
			// GZDoom seems to draw this in the wrong spot...
			// DrawImage("ARMCLS", (95, -22), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloat);
			int armorColor = getArmorColor();
			if(armorPoints.GetInt())
				DrawString(mHUDFont, FormatNumber(GetArmorSavePercent(), 3), (119, -24), DI_SCREEN_CENTER_BOTTOM|DI_TEXT_ALIGN_RIGHT, armorColor, alpha:alphaFloatNum);
			else
				DrawString(mHUDFont, FormatNumber(GetArmorSavePercent() / 5, 2), (116, -24), DI_SCREEN_CENTER_BOTTOM|DI_TEXT_ALIGN_RIGHT, armorColor, alpha:alphaFloatNum);
			
			// Draw Ammo
			Ammo ammo1, ammo2;
			[ammo1, ammo2] = GetCurrentAmmo();
			// Non-standard Weapons
			if (ammo1 != null && !(ammo1 is "Mana1") && !(ammo1 is "Mana2"))
			{
				DrawImage("HAMOBACK", (-83, -36), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloat);
				if (ammo2 != null && ammo1 != ammo2)
				{
					DrawTexture(ammo1.icon, (-71, -28), DI_ITEM_CENTER|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
					DrawTexture(ammo2.icon, (-47, -28), DI_ITEM_CENTER|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
					DrawString(mIndexFont, FormatNumber(ammo1.amount, 3), (-62, -18), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, translation: getAmmoColor(ammo1), alpha:alphaFloatNum);
					DrawString(mIndexFont, FormatNumber(ammo2.amount, 3), (-38, -18), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, translation: getAmmoColor(ammo2), alpha:alphaFloatNum);
				}
				else
				{
					DrawTexture(ammo1.icon, (-60, -28), DI_ITEM_CENTER|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
					DrawString(mIndexFont, FormatNumber(ammo1.amount, 3), (-51, -18), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, translation: getAmmoColor(ammo1), alpha:alphaFloatNum);
				}
			}
			// Standard Weapons
			else
			{
				int amt1, maxamt1, amt2, maxamt2;
				[amt1, maxamt1] = GetAmount("Mana1");
				[amt2, maxamt2] = GetAmount("Mana2");
				// Mana 1
				if ((ammo1 is "Mana1") || (ammo2 is "Mana1")) 
				{
					DrawImage("MANABRT1", (-83, -36), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
					DrawBarTrans("MANAVL1", "", amt1, maxamt1, (-66, -36), 1, SHADER_VERT, DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
				}
				else
				{
					DrawImage("MANADIM1", (-83, -36), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
					DrawBarTrans("MANAVL1D", "", amt1, maxamt1, (-66, -36), 1, SHADER_VERT, DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
				}
				// Mana 2
				if ((ammo1 is "Mana2") || (ammo2 is "Mana2")) 
				{
					DrawImage("MANABRT2", (-50,-36), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
					DrawBarTrans("MANAVL2", "", amt2, maxamt2, (-58, -36), 1, SHADER_VERT, DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
				}
				else
				{
					DrawImage("MANADIM2", (-50,-36), DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
					DrawBarTrans("MANAVL2D", "", amt2, maxamt2, (-58, -36), 1, SHADER_VERT, DI_SCREEN_CENTER_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
				}
				// Deliberately NULL to ensure last proper values get used
				DrawString(mIndexFont, FormatNumber(amt1, 3), (-68, -19), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, translation: getAmmoColor(NULL,amt1,maxamt1), alpha:alphaFloatNum);
				DrawString(mIndexFont, FormatNumber(amt2, 3), (-36, -19), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_CENTER_BOTTOM, translation: getAmmoColor(NULL,amt2,maxamt2), alpha:alphaFloatNum);
			}

			// Check player class name
			string myClassName=CPlayer.mo.GetClassName();

			// Default weapon names
			string myCWeapName="CWeapWraithverge";
			string myMWeapName="MWeapBloodscourge";
			string myFWeapName="FWeapQuietus";

			// Change weapon names according to player class
			if (myClassName=="ClericPlayerNew")
				myCWeapName="CWeapWraithvergeNew";
			if (myClassName=="MagePlayerNew")
				myMWeapName="MWeapBloodscourgeNew";
			if (myClassName=="FighterPlayerNew")
				myFWeapName="FWeapQuietusNew";
			if (myClassName=="ClericTempered")
				myCWeapName="Wraithverge";
			if (myClassName=="MageTempered")
				myMWeapName="Bloodscourge";
			if (myClassName=="FighterTempered")
				myFWeapName="Quietus";
			
			// Draw Ultimate Weapon
			if (myClassName=="ClericPlayer" || myClassName=="ClericPlayerNew" || myClassName=="ClericTempered")
			{
				DrawImage("WPSLOT1", (30, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloat);
				if (CheckInventory(myCWeapName))
					DrawImage("WPFULL1", (30, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
				else
				{
					// These pieces are misaligned in GZDoom
					int pieces = GetWeaponPieceMask(myCWeapName);
					if (pieces & 1)
						DrawImage("WPIECEC1", (30, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
					if (pieces & 2)
						DrawImage("WPIECEC2", (52, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
					if (pieces & 4)
						DrawImage("WPIECEC3", (65, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
				}
			}
			else if (myClassName=="MagePlayer" || myClassName=="MagePlayerNew" || myClassName=="MageTempered")
			{
				DrawImage("WPSLOT2", (30, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloat);
				if (CheckInventory(myMWeapName))
					DrawImage("WPFULL2", (30, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
				else
				{
					int pieces = GetWeaponPieceMask(myMWeapName);
					if (pieces & 1) DrawImage("WPIECEM1", (30, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
					if (pieces & 2) DrawImage("WPIECEM2", (45, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
					if (pieces & 4) DrawImage("WPIECEM3", (64, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
				}
			}
			else if (myClassName=="FighterPlayer" || myClassName=="FighterPlayerNew" || myClassName=="FighterTempered")
			{
				DrawImage("WPSLOT0", (30, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloat);
				if (CheckInventory(myFWeapName))
					DrawImage("WPFULL0", (30, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
				else
				{
					int pieces = GetWeaponPieceMask(myFWeapName);
					if (pieces & 1) DrawImage("WPIECEF1", (30, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
					if (pieces & 2) DrawImage("WPIECEF2", (65, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
					if (pieces & 4) DrawImage("WPIECEF3", (74, -38), DI_ITEM_OFFSETS|DI_SCREEN_CENTER_BOTTOM, alpha:alphaFloatGraph);
				}
			}
		}
	}
}