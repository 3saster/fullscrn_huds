extend Class SpecialDoomStatusBar
{
	mixin CompatFunctions;
	mixin PowerupValues;

	// ===================================
	// Special HUDS for certain PWADS/mods
	// ===================================
	void setSTBARNames()
	{
		// Defaults
		HUD_SMP   = "HUD_SMP";
		HUD_DM    = "HUD_DM";
		HUD_LEFT  = "HUD_LEFT";
		HUD_RIGHT = "HUD_RIGHT";
		STYSNUM   = "STYSNUM";
		STGNUM    = "STGNUM";
		ARMS_OFFSET = 0;
		MUG_OFFSET = 0;

		Font fnt;
		// Deal with compatibility with certain PWADS
		switch(STBAR_HASH)
		{
		case '2d9a53658a9d756702f00e11529a05f5': // Alien Vendetta
			HUD_LEFT  = "HUD_LEFT_AV";
			HUD_RIGHT = "HUD_RIGHT_AV";
			break;

		case 'a6755fa0ac8a74e89529213a0b26b241': // Avactor
			HUD_LEFT  = "HUD_LEFT_AVACT";
			HUD_RIGHT = "HUD_RIGHT_AVACT";
			break;

		case '59eb7834c61abb94b45491ad6435425f': // Eviternity
		case 'e817eaf5fde41aa3d40cc0590079b6e6': // Epic 2
		case 'bde46d9647869a86535c7245648bd847': // Mayhem 2016
			HUD_LEFT  = "HUD_LEFT_EVET";
			HUD_RIGHT = "HUD_RIGHT_EVET";
			break;

		case '55bba172e6b2aaf532b59b34c333887a': // Sunlust
			HUD_LEFT  = "HUD_LEFT_SUNLUST";
			HUD_RIGHT = "HUD_RIGHT_SUNLUST";
			break;

		case 'f75c27163008a99942efb8e26321331c': // Memento Mori 2
			HUD_LEFT  = "HUD_LEFT_MM2";
			HUD_RIGHT = "HUD_RIGHT_MM2";
			STYSNUM   = "MM2_NUM";
			fnt = "INDEXFONT_MM2";
			mIndexFontF = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft);
			fnt = "HUDFONT_MM2";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
			break;

		case 'ff7f01f87976084b8ecb36a5fa9241df': // Back to Saturn X Episode 1
		                 // Doom 4 Vanilla
			HUD_LEFT  = "HUD_LEFT_BTSX";
			HUD_RIGHT = "HUD_RIGHT_BTSX";
			STYSNUM   = "BTSX1_N";
			STGNUM    = "BTSX1_";
			fnt = "INDEXFONT_BTSX1";
			mIndexFontF = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft);
			fnt = "HUDFONT_BTSX";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
			break;

		case '4b0f899d7aed5b2cb92624042d54387f': // Back to Saturn X Episode 2
			HUD_LEFT  = "HUD_LEFT_BTSX";
			HUD_RIGHT = "HUD_RIGHT_BTSX";
			STYSNUM   = "BTSX2_N";
			STGNUM    = "BTSX1_";
			fnt = "INDEXFONT_BTSX2";
			mIndexFontF = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft);
			fnt = "HUDFONT_BTSX";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
			break;

		case 'f5545943edade0df9de4cb40ba36e083': // Neural Upscale 2X Pack
			HUD_SMP   = "HUD_SMP_NEURAL";
			HUD_DM    = "HUD_DM_NEURAL";
			HUD_LEFT  = "HUD_LEFT_NEURAL";
			HUD_RIGHT = "HUD_RIGHT_NEURAL";
			break;

		case 'a29f9e16dcb7ac8a744c4760f1ec9257': // Eternal Doom
		case 'f2fea6600f7bec08d4bca8995163a3cb': // Mayhem 2048
			HUD_LEFT  = "HUD_LEFT_ETERNAL";
			HUD_RIGHT = "HUD_RIGHT_ETERNAL";
			STYSNUM = "ETE_NUM";
			ARMS_OFFSET = -2.5;
			fnt = "HUDFONT_ETERNAL";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
			break;

		case 'b65eb1a13d873457e147f34cd72daa09': // Mayhem 2018 - Orange Edition
			HUD_LEFT  = "HUD_LEFT_TN";
			HUD_RIGHT = "HUD_RIGHT_TN";
			break;

		case 'c348f353ef94c247b3cc3e99fcd9b0fd': // Mayhem 2018 - Purple Edition
			STGNUM = "BTSX1_";
			break;

		case '2c2a7e0ac35806ae5d2654c33584f0e0': // Tangerine Nightmare
			HUD_LEFT  = "HUD_LEFT_TN";
			HUD_RIGHT = "HUD_RIGHT_TN";
			STGNUM = "STG_TN";
			break;

		case '08c30fe8a2183a442bee8a6eedae3764': // Dystopia 3
			HUD_LEFT = "HUD_LEFT_DYSTOPIA";
			break;

		case '071b93d8d4c0fa065f4ea1b1a9bc3978': // Community Chest Series
			HUD_SMP   = "HUD_SMP_CCHEST";
			HUD_DM    = "HUD_DM_CCHEST";
			HUD_LEFT  = "HUD_LEFT_CCHEST";
			HUD_RIGHT = "HUD_RIGHT_CCHEST";
			MUG_OFFSET = -2;
			ARMS_OFFSET = -2;
			break;
			
		case '8dcdb62f3b23acf052f47ff0f08f3b04': // techbar.wad (idgames 393)
			STYSNUM   = "TECHNUM";
			break;
		}

		if( isChex() )
		{
			STYSNUM   = "CTYSNUM";
			STGNUM    = "CTGNUM";
		}
	}

	Array<String> ammoNames;
	// ===========================================
	// Override to ensure standard HUD still works
	// ===========================================
	override void DrawBarAmmo()
	{
		int amt1, maxamt;
		
		for(int i = 0; i < ammoNames.size(); i++)
		{
			[amt1, maxamt] = GetAmount(ammoNames[i]);
			DrawString(mIndexFont, FormatNumber(amt1, 3), (288, 173+6*i), DI_TEXT_ALIGN_RIGHT);
			DrawString(mIndexFont, FormatNumber(maxamt, 3), (314, 173+6*i), DI_TEXT_ALIGN_RIGHT);
		}
	}
	
	// ===================================
	// Get Ammo Names for particular games
	// ===================================
	void setAmmoNames()
	{
		string ammoString;
		if( isPirateDoom() )
			ammoString = "Bullets, Shell, ballammo, dynamiteammo";
		else if( isHacX() )
			ammoString = "HacxRounds, HacxCartridges, HacxTorpedo, HacxMolecules";
		else if ( isHarmony() )
			ammoString = "MinigunAmmo, Shells, TimeBombAmmo, ChaosBarsAmmo";
		else
			ammoString = "Clip, Shell, RocketAmmo, Cell";
		ammoString.Split(ammoNames, ", ");
	}
}