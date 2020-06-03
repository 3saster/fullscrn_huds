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
		MUG_OFFSET  = 0;
		KEY_OFFSET  = 0;
		CURR_OFFSET = 0;
		MAX_OFFSET  = 0;

		ARM_POS[0] = (-49, -28);
		ARM_POS[1] = (-37, -28);
		ARM_POS[2] = (-25, -28);
		ARM_POS[3] = (-49, -18);
		ARM_POS[4] = (-37, -18);
		ARM_POS[5] = (-25, -18);

		Font fnt;
		// Deal with compatibility with certain PWADS
		switch(STBAR_HASH)
		{
		// Potentially reusable

		case '59eb7834c61abb94b45491ad6435425f': // Eviternity
		case 'e817eaf5fde41aa3d40cc0590079b6e6': // Epic 2
		case 'bde46d9647869a86535c7245648bd847': // Mayhem 2016
		case '8e8f9a2aa65286e0ff9cb181ccfd9843': // demonaly.wad (idgames 2385)
			HUD_LEFT  = "HUD_LEFT_EVET";
			HUD_RIGHT = "HUD_RIGHT_EVET";
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

		case 'b65eb1a13d873457e147f34cd72daa09': // Mayhem 2018 - Orange Edition
			HUD_LEFT  = "HUD_LEFT_TN";
			HUD_RIGHT = "HUD_RIGHT_TN";
			break;

		case '00851c42265ed1b801f528c5e29c8630': // cordless.wad (idgames 3417)
			HUD_LEFT  = "HUD_LEFT_CORDLESS";
			break;

		case '50bd0007b419abf85258af27e21f490e': // flash3.wad (idgames 5114)
			HUD_LEFT  = "HUD_LEFT_FLASH3";
			HUD_RIGHT = "HUD_RIGHT_FLASH3";
			KEY_OFFSET = -1;
			break;

		case 'f8dc08729966f4c168e3c31a087ac301': // oasis.wad (idgames 6834)
			STYSNUM   = "OASSNUM";
			STGNUM    = "OASNUM";
			break;

		// More Specific

		case '2d9a53658a9d756702f00e11529a05f5': // Alien Vendetta
			HUD_LEFT  = "HUD_LEFT_AV";
			HUD_RIGHT = "HUD_RIGHT_AV";
			break;

		case 'a6755fa0ac8a74e89529213a0b26b241': // Avactor
			HUD_LEFT  = "HUD_LEFT_AVACT";
			HUD_RIGHT = "HUD_RIGHT_AVACT";
			break;
		
		case '9c6a02d01d54b659227206b14d21bd6c': // dethtwer.wad (idgames 2385)
			HUD_LEFT  = "HUD_LEFT_EVET";
			HUD_RIGHT = "HUD_RIGHT_EVET";
			KEY_OFFSET = 1;
			break;

		case '55bba172e6b2aaf532b59b34c333887a': // Sunlust
			HUD_LEFT  = "HUD_LEFT_SUNLUST";
			HUD_RIGHT = "HUD_RIGHT_SUNLUST";
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

		case '260b66e490914772e0a2b58ccc6e0b6c': // Community Chest Series
		case '071b93d8d4c0fa065f4ea1b1a9bc3978':
			HUD_SMP   = "HUD_SMP_CCHEST";
			HUD_DM    = "HUD_DM_CCHEST";
			HUD_LEFT  = "HUD_LEFT_CCHEST";
			HUD_RIGHT = "HUD_RIGHT_CCHEST";
			MUG_OFFSET = -2;
			ARMS_OFFSET = -2;
			break;

		case '53b8fa85ddc7f565c7c0f39395036b88': // Icarus Alien Vanguard
			HUD_LEFT   = "ICARUS_L";
			KEY_OFFSET = -0.5;
			break;
			
		case '8dcdb62f3b23acf052f47ff0f08f3b04': // techbar.wad (idgames 393)
		case 'efb2ab6a075bc4df7e680eb055148425': // dakills.wad (idgames 2803)
		case '191ecbdf589e1d48696c14216245c27b': // AD3         (idgames 5254)
		case '0d93069b1085063ace63fedb42c2ad68': // weapons.wad (idgames 5760)
			STYSNUM   = "TECHNUM";
			break;
			
		case '5195a746bd49b52cdfec75c0ce38100a': // Homer Doom 2 (idgames 982)
			HUD_LEFT  = "HUD_LEFT_HOMERDOOM2";
			HUD_RIGHT = "HUD_RIGHT_HOMERDOOM2";
			KEY_OFFSET = 3.5;
			break;

		case '1bc635697cd4639c27a60932f53a6fa8': // fire.wad (idgames 3552)
			fnt = "HUDFONT_FIRE";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 0, 0);
			break;

		case '6bfd5ba52a1e2b2d3f43dcca49c45929': // tpp.wad (idgames 5302)
			fnt = "HUDFONT_TPP";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 0, 0);
			break;

		case '6930f045a424adae01fbe13a078bb1f9': // q-zone.wad (idgames 5974)
			fnt = "HUDFONT_QZONE";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 0, 0);
			break;

		case '4daaf88703754aa427004b879c60e8d1': // thetick.wad (idgames 6851)
			HUD_SMP   = "TICK_SMP";
			HUD_DM    = "TICK_DM";
			HUD_LEFT  = "TICK_L";
			HUD_RIGHT = "TICK_R";
			break;

		case '5e338c397dd1f87adfaa50424f4c496a': // Threshold Of Pain (idgames 16196)
			KEY_OFFSET = 1;
			ARM_POS[0] = (-47, -28);
			ARM_POS[1] = (-36, -28);
			ARM_POS[2] = (-24, -28);
			ARM_POS[3] = (-47, -17);
			ARM_POS[4] = (-36, -17);
			ARM_POS[5] = (-24, -17);
			break;
		}

		if( isChex() )
		{
			STYSNUM   = "CTYSNUM";
			STGNUM    = "CTGNUM";
		}
		else if( isEWPack() )
		{
			HUD_SMP   = "HUD_SMP_EWPACK";
			HUD_DM    = "HUD_DM_EWPACK";
			HUD_LEFT  = "HUD_LEFT_EWPACK";
			HUD_RIGHT = "HUD_RIGHT_EWPACK";
		}
		else if( isCorTech() )
		{
			CURR_OFFSET = 7;
			MAX_OFFSET =  3;
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
		else if ( isEWPack() )
			ammoString = "Chlip, Chell, ChocketAmmo, Chattery";
		else if ( isHellAwake2() )
			ammoString = "Shell, Clip, RocketAmmo, Cell";
		else
			ammoString = "Clip, Shell, RocketAmmo, Cell";
		ammoString.Split(ammoNames, ", ");
	}
}