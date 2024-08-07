extend Class SpecialHexenStatusBar
{
	void DrawSplit ()
	{
		double alphaFloat = 1-alphaValue.getfloat(); // Transparency
		
		int alphaO = alphaOpaque.GetInt();
		double alphaFloatNum = alphaO == OP_NUM || alphaO == OP_NUMGRAPH ? 1 : alphaFloat;
		double alphaFloatGraph = alphaO == OP_NUMGRAPH ? 1 : alphaFloat;
		
		// Draw left side
		string barLeft = (deathmatch || teamplay) ? "BAR_KILL" : "BAR_LEFT";
		DrawImage(barLeft, (0, 0), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_LEFT_BOTTOM, alphaFloat);
		
		// Draw right side
		DrawImage("BAR_RGHT", (0, 0), DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_RIGHT_BOTTOM, alphaFloat);
		
		// Draw Health
		// Unnecessary, and GZDoom seems to draw this in the wrong spot...
		// DrawImage("ARMCLS", (5, -15), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloat);
		int healthColor = getHealthColor();
		DrawString(mHUDFont, FormatNumber(mHealthInterpolator.GetValue(), 3), (30, -17), DI_SCREEN_LEFT_BOTTOM|DI_TEXT_ALIGN_RIGHT, healthColor, alpha:alphaFloatNum);
		
		// Draw frags
		if (deathmatch || teamplay)
			DrawString(mHUDFont, FormatNumber(CPlayer.FragCount, 3), (126, -17), DI_SCREEN_LEFT_BOTTOM|DI_TEXT_ALIGN_RIGHT, alpha:alphaFloatNum);
		
		// Draw Ammo
		Ammo ammo1, ammo2;
		[ammo1, ammo2] = GetCurrentAmmo();
		// Non-standard Weapons
		if (ammo1 != null && !(ammo1 is "Mana1") && !(ammo1 is "Mana2"))
		{
			DrawImage("HAMOBACK", (41, -29), DI_ITEM_OFFSETS|DI_SCREEN_LEFT_BOTTOM, alpha:alphaFloat);
			if (ammo2 != null && ammo1 != ammo2)
			{
				DrawTexture(ammo1.icon, (53, -21), DI_ITEM_CENTER|DI_SCREEN_LEFT_BOTTOM, alpha:alphaFloatGraph);
				DrawTexture(ammo2.icon, (77, -21), DI_ITEM_CENTER|DI_SCREEN_LEFT_BOTTOM, alpha:alphaFloatGraph);
				DrawString(mIndexFont, FormatNumber(ammo1.amount, 3), (62, -11), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_LEFT_BOTTOM, translation: getAmmoColor(ammo1), alpha:alphaFloatNum);
				DrawString(mIndexFont, FormatNumber(ammo2.amount, 3), (86, -11), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_LEFT_BOTTOM, translation: getAmmoColor(ammo2), alpha:alphaFloatNum);
			}
			else
			{
				DrawTexture(ammo1.icon, (64, -21), DI_ITEM_CENTER|DI_SCREEN_LEFT_BOTTOM, alpha:alphaFloatGraph);
				DrawString(mIndexFont, FormatNumber(ammo1.amount, 3), (73, -11), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_LEFT_BOTTOM, translation: getAmmoColor(ammo1), alpha:alphaFloatNum);
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
				DrawImage("MANABRT1", (41, -29), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
				DrawBarTrans("MANAVL1", "", amt1, maxamt1, (58, -29), 1, SHADER_VERT, DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
			}
			else
			{
				DrawImage("MANADIM1", (41, -29), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
				DrawBarTrans("MANAVL1D", "", amt1, maxamt1, (58, -29), 1, SHADER_VERT, DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
			}
			// Mana 2
			if ((ammo1 is "Mana2") || (ammo2 is "Mana2")) 
			{
				DrawImage("MANABRT2", (74,-29), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
				DrawBarTrans("MANAVL2", "", amt2, maxamt2, (66, -29), 1, SHADER_VERT, DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
			}
			else
			{
				DrawImage("MANADIM2", (74,-29), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
				DrawBarTrans("MANAVL2D", "", amt2, maxamt2, (66, -29), 1, SHADER_VERT, DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatGraph);
			}
			// Deliberately NULL to ensure last proper values get used
			DrawString(mIndexFont, FormatNumber(amt1, 3), (56, -12), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_LEFT_BOTTOM, translation: getAmmoColor(NULL,amt1,maxamt1), alpha:alphaFloatNum);
			DrawString(mIndexFont, FormatNumber(amt2, 3), (88, -12), DI_TEXT_ALIGN_RIGHT|DI_SCREEN_LEFT_BOTTOM, translation: getAmmoColor(NULL,amt2,maxamt2), alpha:alphaFloatNum);
		}

		// Check player class name
		string myClassName=CPlayer.mo.GetClassName();

		// Default weapon names
		string myCWeapName="CWeapWraithverge";
		string myMWeapName="MWeapBloodscourge";
		string myFWeapName="FWeapQuietus";

		// Change weapon names according to player class
		if (myClassName=="ClericPlayerNew")  myCWeapName="CWeapWraithvergeNew";
		if (myClassName=="MagePlayerNew")    myMWeapName="MWeapBloodscourgeNew";
		if (myClassName=="FighterPlayerNew") myFWeapName="FWeapQuietusNew";
		if (myClassName=="ClericTempered")   myCWeapName="Wraithverge";
		if (myClassName=="MageTempered")     myMWeapName="Bloodscourge";
		if (myClassName=="FighterTempered")  myFWeapName="Quietus";
		
		// Draw Ultimate Weapon
		if (myClassName=="ClericPlayer" || myClassName=="ClericPlayerNew" || myClassName=="ClericTempered")
		{
			DrawImage("WPSLOT1", (-93, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloat);
			if (CheckInventory(myCWeapName))
				DrawImage("WPFULL1", (-93, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
			else
			{
				// These pieces are misaligned in GZDoom
				int pieces = GetWeaponPieceMask(myCWeapName);
				if (pieces & 1)
					DrawImage("WPIECEC1", (-93, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
				if (pieces & 2)
					DrawImage("WPIECEC2", (-71, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
				if (pieces & 4)
					DrawImage("WPIECEC3", (-58, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
			}
		}
		else if (myClassName=="MagePlayer" || myClassName=="MagePlayerNew" || myClassName=="MageTempered")
		{
			DrawImage("WPSLOT2", (-93, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloat);
			if (CheckInventory(myMWeapName))
				DrawImage("WPFULL2", (-93, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
			else
			{
				int pieces = GetWeaponPieceMask(myMWeapName);
				if (pieces & 1) DrawImage("WPIECEM1", (-93, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
				if (pieces & 2) DrawImage("WPIECEM2", (-78, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
				if (pieces & 4) DrawImage("WPIECEM3", (-59, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
			}
		}
		else if (myClassName=="FighterPlayer" || myClassName=="FighterPlayerNew" || myClassName=="FighterTempered")
		{
			DrawImage("WPSLOT0", (-93, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloat);
			if (CheckInventory(myFWeapName))
				DrawImage("WPFULL0", (-93, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
			else
			{
				int pieces = GetWeaponPieceMask(myFWeapName);
				if (pieces & 1) DrawImage("WPIECEF1", (-93, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
				if (pieces & 2) DrawImage("WPIECEF2", (-58, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
				if (pieces & 4) DrawImage("WPIECEF3", (-49, -31), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM, alpha:alphaFloatGraph);
			}
		}
		
		// Draw Armor
		// GZDoom seems to draw this in the wrong spot...
		// DrawImage("ARMCLS", (-28, -15), DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_OFFSETS, alphaFloat);
		int armorColor = getArmorColor();
		if(armorPoints.GetInt())
			DrawString(mHUDFont, FormatNumber(GetArmorSavePercent(), 3), (-4, -17), DI_SCREEN_RIGHT_BOTTOM|DI_TEXT_ALIGN_RIGHT, armorColor, alpha:alphaFloatNum);
		else
			DrawString(mHUDFont, FormatNumber(GetArmorSavePercent() / 5, 2), (-7, -17), DI_SCREEN_RIGHT_BOTTOM|DI_TEXT_ALIGN_RIGHT, armorColor, alpha:alphaFloatNum);
		
		// Draw Split Arms over ammo display if CVAR is on
		if(splitArms.GetInt())
		{
			DrawImage(CPlayer.HasWeaponsInSlot(1)? concat(SMALLIN,"1") : concat(SMALLGR,"1"), (96, -29+0*7), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(CPlayer.HasWeaponsInSlot(2)? concat(SMALLIN,"2") : concat(SMALLGR,"2"), (96, -29+1*7), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(CPlayer.HasWeaponsInSlot(3)? concat(SMALLIN,"3") : concat(SMALLGR,"3"), (96, -29+2*7), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
			DrawImage(CPlayer.HasWeaponsInSlot(4)? concat(SMALLIN,"4") : concat(SMALLGR,"4"), (96, -29+3*7), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_OFFSETS, alphaFloatNum);
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

		// Draw Inventory
		else if (CPlayer.mo.InvSel != null)
		{
			DrawInventoryIcon(CPlayer.mo.InvSel, (-111.5, -16), DI_ARTIFLASH|DI_ITEM_CENTER|DI_SCREEN_RIGHT_BOTTOM,alpha:alphaFloatGraph, boxsize:(28, 28));
			if (CPlayer.mo.InvSel.Amount > 1)
				DrawString(mIndexFont, FormatNumber(CPlayer.mo.InvSel.Amount, 3), (-97, -7), DI_SCREEN_RIGHT_BOTTOM|DI_TEXT_ALIGN_RIGHT, Font.CR_UNTRANSLATED, alpha:alphaFloatNum);
		}
	}
}