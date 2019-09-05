extend Class SpecialHexenStatusBar
{
	void DrawSplitAutomap()
	{
		DrawImage("KEYBAR_L", (0, 0), DI_SCREEN_LEFT_BOTTOM|DI_ITEM_LEFT_BOTTOM);
		DrawImage("KEYBAR_R", (0, 0), DI_SCREEN_RIGHT_BOTTOM|DI_ITEM_RIGHT_BOTTOM);
		
		// Draw Keys
		int cnt = 0;
		Vector2 keypos = (6, -30);
		for(let i = CPlayer.mo.Inv; i != null; i = i.Inv)
		{
			if (i is "Key" && i.Icon.IsValid())
			{
				DrawTexture(i.Icon, keypos, DI_ITEM_OFFSETS|DI_SCREEN_LEFT_BOTTOM);
				keypos.X += 20;
				if (++cnt >= 5) break;
			}
		}
		
		// Draw Armor
		DrawHexenArmor(HEXENARMOR_ARMOR,  "ARMSLOT1", (-128, -30), DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM);
		DrawHexenArmor(HEXENARMOR_SHIELD, "ARMSLOT2", (-97, -30),  DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM);
		DrawHexenArmor(HEXENARMOR_HELM,   "ARMSLOT3", (-66, -30),   DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM);
		DrawHexenArmor(HEXENARMOR_AMULET, "ARMSLOT4", (-35, -30),   DI_ITEM_OFFSETS|DI_SCREEN_RIGHT_BOTTOM);
	}
}