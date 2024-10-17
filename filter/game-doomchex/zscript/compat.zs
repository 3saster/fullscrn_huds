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
		STYSNUM     = "STYSNUM";
		STGNUM      = "STGNUM";
		ARMS_OFFSET = 0;
		MUG_OFFSET  = 0;

		// Determine which widescreen graphics to use
		TextureID bar   = TexMan.CheckForTexture("STBAR");
		vector2 barsize = TexMan.GetScaledSize(bar);
                int barwidth    = barsize.x;

		switch(barsize.x)
		{
			case 426:
			case 428:
			case 430:
			case 486:
			case 574:
			case 576:
			case 640:
			case 768:
			case 900:
			case 960:
			case 1000:
			case 1600:
				HUD_SMP   = "HUD_SMP_WIDE"..barwidth.."P";
				HUD_DM    = "HUD_DM_WIDE"..barwidth.."P";
				HUD_LEFT  = "HUD_LEFT_WIDE"..barwidth.."P";
				HUD_RIGHT = "HUD_RIGHT_WIDE"..barwidth.."P";
				break;
			default:
				HUD_SMP   = "HUD_SMP";
				HUD_DM    = "HUD_DM";
				HUD_LEFT  = "HUD_LEFT";
				HUD_RIGHT = "HUD_RIGHT";
				break;
		}

		Font fnt;

		// Compatibility for certain PWADS
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

			case 'ff7f01f87976084b8ecb36a5fa9241df': // Back to Saturn X Ep.1
		                 			         // Doom 4 Vanilla
				HUD_LEFT    = "HUD_LEFT_BTSX";
				HUD_RIGHT   = "HUD_RIGHT_BTSX";
				STYSNUM     = "BTSX1_N";
				STGNUM      = "BTSX1_";
				fnt         = "INDEXFONT_BTSX1";
				mIndexFontF = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft);
				fnt         = "HUDFONT_BTSX";
				mHUDFont    = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
				break;

			case '4b0f899d7aed5b2cb92624042d54387f': // Back to Saturn X Ep.2
				HUD_LEFT    = "HUD_LEFT_BTSX";
				HUD_RIGHT   = "HUD_RIGHT_BTSX";
				STYSNUM     = "BTSX2_N";
				STGNUM      = "BTSX1_";
				fnt         = "INDEXFONT_BTSX2";
				mIndexFontF = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft);
				fnt         = "HUDFONT_BTSX";
				mHUDFont    = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
				break;

			case '071b93d8d4c0fa065f4ea1b1a9bc3978': // Community Chest Series
				HUD_SMP     = "HUD_SMP_CCHEST";
				HUD_DM      = "HUD_DM_CCHEST";
				HUD_LEFT    = "HUD_LEFT_CCHEST";
				HUD_RIGHT   = "HUD_RIGHT_CCHEST";
				MUG_OFFSET  = -2;
				ARMS_OFFSET = -2;
				break;

			case '08c30fe8a2183a442bee8a6eedae3764': // Dystopia 3
				HUD_LEFT = "HUD_LEFT_DYSTOPIA";
				break;

			case 'a29f9e16dcb7ac8a744c4760f1ec9257': // Eternal Doom
			case 'f2fea6600f7bec08d4bca8995163a3cb': // Mayhem 2048
				HUD_LEFT    = "HUD_LEFT_ETERNAL";
				HUD_RIGHT   = "HUD_RIGHT_ETERNAL";
				STYSNUM     = "ETE_NUM";
				ARMS_OFFSET = -2.5;
				fnt         = "HUDFONT_ETERNAL";
				mHUDFont    = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
				break;

			case '59eb7834c61abb94b45491ad6435425f': // Eviternity
			case 'e817eaf5fde41aa3d40cc0590079b6e6': // Epic 2
			case 'bde46d9647869a86535c7245648bd847': // Mayhem 2016
				HUD_LEFT  = "HUD_LEFT_EVIT";
				HUD_RIGHT = "HUD_RIGHT_EVIT";
				break;

			case 'b65eb1a13d873457e147f34cd72daa09': // Mayhem 2018 - Orange Edition
				HUD_LEFT  = "HUD_LEFT_TN";
				HUD_RIGHT = "HUD_RIGHT_TN";
				break;

			case 'c348f353ef94c247b3cc3e99fcd9b0fd': // Mayhem 2018 - Purple Edition
				STGNUM = "BTSX1_";
				break;

			case 'f75c27163008a99942efb8e26321331c': // Memento Mori 2
				HUD_LEFT    = "HUD_LEFT_EVET";
				STYSNUM     = "MM2_NUM";
				fnt         = "INDEXFONT_MM2";
				mIndexFontF = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft);
				fnt         = "HUDFONT_MM2";
				mHUDFont    = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
				break;

			case 'a0411c98547d79d11fe3957fe29debab': // No End In Sight
				HUD_LEFT  = "HUD_LEFT_EVET";
				HUD_RIGHT = "HUD_RIGHT_NEIS";
				break;

			case '55bba172e6b2aaf532b59b34c333887a': // Sunlust
				HUD_LEFT  = "HUD_LEFT_SUNLUST";
				HUD_RIGHT = "HUD_RIGHT_SUNLUST";
				break;

			case '2c2a7e0ac35806ae5d2654c33584f0e0': // Tangerine Nightmare
				HUD_LEFT  = "HUD_LEFT_TN";
				HUD_RIGHT = "HUD_RIGHT_TN";
				STGNUM    = "STG_TN";
				break;

                	// WIDESCREEN

			case '5890f9a021d52463bc0b32a74e7726f0': // Eviternity II
                        	HUD_LEFT  = "HUD_LEFT_EVIT2";
                        	HUD_RIGHT = "HUD_RIGHT_EVIT2";
                        	break;

			case 'ede5fef3207c78ae9e1cfb91141c4b5e': // No End In Sight (Unity)
                        	HUD_LEFT  = "HUD_LEFT_NEISWIDE";
                        	HUD_RIGHT = "HUD_RIGHT_NEISWIDE";
                        	break;

			case '8a5a05b8fbaea3096ff4ecb0a49da989': // Reconditus
				HUD_LEFT  = "HUD_LEFT_RECON";
				HUD_RIGHT = "HUD_RIGHT_RECON";
				break;

                        case 'd84cfb0cbb6d521462fb5ad5495dd89a': // Super Doom TV
                        	HUD_LEFT  = "HUD_LEFT_SDTV";
                        	HUD_RIGHT = "HUD_RIGHT_SDTV";
                        	break;

                	// HIGHRES

			case 'f5545943edade0df9de4cb40ba36e083': // Neural Upscale 2X Pack
				HUD_SMP   = "HUD_SMP_HIRES2X";
				HUD_DM    = "HUD_DM_HIRES2X";
				HUD_LEFT  = "HUD_LEFT_HIRES2X";
				HUD_RIGHT = "HUD_RIGHT_HIRES2X";
				break;

			case '5cbb48660fdb94f2114e974bd4520e19': // Bloody Steel
				HUD_SMP     = "HUD_SMP_HIRES4X";
				HUD_DM      = "HUD_DM_HIRES4X";
				HUD_LEFT    = "HUD_LEFT_HIRES4X";
				HUD_RIGHT   = "HUD_RIGHT_HIRES4X";
                        	MUG_OFFSET  = 2;
                        	ARMS_OFFSET = 2;
				break;
		}

		if( isChex() )
		{
			STYSNUM = "CTYSNUM";
			STGNUM  = "CTGNUM";
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
		else if( isBrutalDoom() )
			ammoString = "Clip2, AmmoShell, AmmoRocket, AmmoCell";
		else if( isHacX() )
			ammoString = "HacxRounds, HacxCartridges, HacxTorpedo, HacxMolecules";
		else if ( isHarmony() )
			ammoString = "MinigunAmmo, Shells, TimeBombAmmo, ChaosBarsAmmo";
		else
			ammoString = "Clip, Shell, RocketAmmo, Cell";
		ammoString.Split(ammoNames, ", ");
	}
}