extend Class SpecialDoomStatusBar
{

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

		Font fnt;
		// Deal with compatibility with certain PWADS
		switch(STBAR_HASH)
		{
		case 0x0B3CB286: // Alien Vendetta
			HUD_LEFT  = "HUD_LEFT_AV";
			HUD_RIGHT = "HUD_RIGHT_AV";
			break;

		case 0xABEED637: // Avactor
			HUD_LEFT  = "HUD_LEFT_AVACT";
			HUD_RIGHT = "HUD_RIGHT_AVACT";
			break;

		case 0x2DB89823: // Eviternity
		case 0x4F9D3A57: // Epic 2
			HUD_LEFT  = "HUD_LEFT_EVET";
			HUD_RIGHT = "HUD_RIGHT_EVET";
			break;

		case 0x41195678: // Sunlust
			HUD_LEFT  = "HUD_LEFT_SUNLUST";
			HUD_RIGHT = "HUD_RIGHT_SUNLUST";
			break;

		case 0xB43917B8: // Memento Mori 2
			HUD_LEFT  = "HUD_LEFT_MM2";
			HUD_RIGHT = "HUD_RIGHT_MM2";
			STYSNUM   = "MM2_NUM";
			fnt = "INDEXFONT_MM2";
			mIndexFontF = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft);
			fnt = "HUDFONT_MM2";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
			break;

		case 0x0D8A3598: // Back to Saturn X Episode 1
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

		case 0x67E84763: // Back to Saturn X Episode 2
			HUD_LEFT  = "HUD_LEFT_BTSX";
			HUD_RIGHT = "HUD_RIGHT_BTSX";
			STYSNUM   = "BTSX2_N";
			STGNUM    = "BTSX1_";
			fnt = "INDEXFONT_BTSX2";
			mIndexFontF = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft);
			fnt = "HUDFONT_BTSX";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
			break;

		case 0xDF842DC3: // Neural Upscale 2X Pack
			HUD_SMP   = "HUD_SMP_NEURAL";
			HUD_DM    = "HUD_DM_NEURAL";
			HUD_LEFT  = "HUD_LEFT_NEURAL";
			HUD_RIGHT = "HUD_RIGHT_NEURAL";
			break;

		case 0xF1837667: // Eternal Doom
			HUD_LEFT  = "HUD_LEFT_ETERNAL";
			HUD_RIGHT = "HUD_RIGHT_ETERNAL";
			STYSNUM = "ETE_NUM";
			ARMS_OFFSET = -2.5;
			fnt = "HUDFONT_ETERNAL";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
			break;

		case 0xC901D1A0: // Tangerine Nightmare
			HUD_LEFT  = "HUD_LEFT_TN";
			HUD_RIGHT = "HUD_RIGHT_TN";
			STGNUM = "STG_TN";
			break;

		case 0xC0A46A33: // Dystopia 3
			HUD_LEFT = "HUD_LEFT_DYSTOPIA";
			break;
		}

		if( isChex() )
		{
			STYSNUM   = "CTYSNUM";
			STGNUM    = "CTGNUM";
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

	Array<String> PowerupNames;   //Actual Name of the powerup
	Array<String> PowerupDisplay; //Name to display on stats
	// =============================
	// Get Powerup Names and Strings
	// =============================
	// Special thanks to Tekish's Levelinfo, since this saved me a lot of time
	void setPowerupNames()
	{
		let pclass = CPlayer.mo.GetClassName();
		string s; //Use this to avoid error on startup
		// Argent
		if (pclass == "ArgPlayer")
		{
			//PowerupNames.Push("PowerStrength");				PowerupDisplay.Push("Berserk");
			PowerupNames.Push("ArgPowerHasteSpeed");		PowerupDisplay.Push("Fast");
			PowerupNames.Push("PowerInvisibility");			PowerupDisplay.Push("Hidden");
			PowerupNames.Push("ArgPowerInvuln");			PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerLightamp");				PowerupDisplay.Push("Light");
			PowerupNames.Push("ArgPowerQuadDamage");		PowerupDisplay.Push("Quad");
			PowerupNames.Push("ArgPowerRegen");				PowerupDisplay.Push("Regen");
			PowerupNames.Push("PowerIronfeet");				PowerupDisplay.Push("Suit");
			return;
		}

		// Ashes 2063
		if (pclass == "Scavenger")
		{
			PowerupNames.Push("PowerInvulnerable");			PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerDoubleFiringSpeed");	PowerupDisplay.Push("Rage");
			PowerupNames.Push("PowerRegeneration");			PowerupDisplay.Push("Regen");
			PowerupNames.Push("PowerIronfeet");				PowerupDisplay.Push("Suit");
			return;
		}

		// Brutal Doom
		s = "IsNOTTacticalClass";
		if (pclass == "BDoomer" || pclass == "Doomer2" || pclass == "TacticalDoomer" || (pclass == "Purist" && CPlayer.mo.findinventory(s)))
		{
			//PowerupNames.Push("PowerStrength");				PowerupDisplay.Push("Berserk");
			PowerupNames.Push("PowerInvisibility");			PowerupDisplay.Push("Hidden");
			PowerupNames.Push("PowerInvulnerable");			PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerTransformBaron");		PowerupDisplay.Push("Morph");
			PowerupNames.Push("PowerTransformRevenant");	PowerupDisplay.Push("Morph");
			PowerupNames.Push("PowerTorch");				PowerupDisplay.Push("Light");
			PowerupNames.Push("PowerIronfeet");				PowerupDisplay.Push("Suit");
			return;
		}

		// Death Foretold
		if (pclass == "Doom4Player")
		{
			PowerupNames.Push("PowerD4Strength");			PowerupDisplay.Push("Berserk");
			PowerupNames.Push("PowerD4Speed");				PowerupDisplay.Push("Fast");
			PowerupNames.Push("PowerD4Invisibility");		PowerupDisplay.Push("Hidden");
			PowerupNames.Push("PowerD4Invulnerable");		PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerLightamp");				PowerupDisplay.Push("Light");
			PowerupNames.Push("PowerQDamage");				PowerupDisplay.Push("Quad");
			PowerupNames.Push("PowerD4Regeneration");		PowerupDisplay.Push("Regen");
			PowerupNames.Push("PowerD4IronFeet");			PowerupDisplay.Push("Suit");
			return;
		}

		// Doom 64 Retribution
		s = "Stamina";
		if (pclass == "64DoomPlayer" && !CPlayer.mo.findinventory(s))
		{
			//PowerupNames.Push("PowerStrength");				PowerupDisplay.Push("Berserk");
			PowerupNames.Push("PowerInvisibility");			PowerupDisplay.Push("Hidden");
			PowerupNames.Push("PowerInvulnerable");			PowerupDisplay.Push("Immune");
			PowerupNames.Push("64PowerLightAmp");			PowerupDisplay.Push("Light");
			PowerupNames.Push("PowerIronfeet");				PowerupDisplay.Push("Suit");
			return;
		}

		// Doom Incarnate
		if (pclass == "CaptainBlazkowicz")
		{
			PowerupNames.Push("PowerWrath");				PowerupDisplay.Push("Berserk");
			PowerupNames.Push("PowerPsyche");				PowerupDisplay.Push("Hidden");
			PowerupNames.Push("PowerBattleSuit");			PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerLightamp");				PowerupDisplay.Push("Light");
			PowerupNames.Push("PowerQuadDamage");			PowerupDisplay.Push("Quad");
			PowerupNames.Push("PowerQ3Regeneration");		PowerupDisplay.Push("Regen");
			PowerupNames.Push("PowerIronfeet");				PowerupDisplay.Push("Suit");
			return;
		}

		// Flakes Doom
		s = "FirstTimeShotgunning";
		if (pclass == "FKPlayer" && CPlayer.mo.findinventory(s))
		{
			PowerupNames.Push("PowerHaste");				PowerupDisplay.Push("Fast");
			PowerupNames.Push("PowerInvisibility");			PowerupDisplay.Push("Hidden");
			PowerupNames.Push("PowerInvulnerable");			PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerLightAmp");				PowerupDisplay.Push("Light");
			PowerupNames.Push("PowerQuadDamage");			PowerupDisplay.Push("Quad");
			PowerupNames.Push("PowerIronfeet");				PowerupDisplay.Push("Suit");
			return;
		}

		// Project Brutality
		s = "IsNOTTacticalClass";
		if (pclass == "BrutalDoomer" || pclass == "Traditional" || (pclass == "Purist" && !CPlayer.mo.findinventory(s)))
		{
			//PowerupNames.Push("PowerStrength");				PowerupDisplay.Push("Berserk");
			PowerupNames.Push("PowerDoubleDamage");			PowerupDisplay.Push("Damage");
			PowerupNames.Push("PowerSpeed");				PowerupDisplay.Push("Fast");
			PowerupNames.Push("PowerInvisibility");			PowerupDisplay.Push("Hidden");
			PowerupNames.Push("PowerInvulnerable");			PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerLightAmp");				PowerupDisplay.Push("Light");
			PowerupNames.Push("DemonVision");				PowerupDisplay.Push("Morph");
			PowerupNames.Push("PowerDoubleFiringSpeed");	PowerupDisplay.Push("Rage");
			PowerupNames.Push("PowerTimeFreezer");			PowerupDisplay.Push("Time");
			PowerupNames.Push("PowerIronfeet");				PowerupDisplay.Push("Suit");
			return;
		}

		// Doom, Heretic, Hexen, Strife
		//PowerupNames.Push("PowerStrength");				PowerupDisplay.Push("Berserk");
		PowerupNames.Push("PowerScanner");				PowerupDisplay.Push("Detect");
		PowerupNames.Push("PowerSpeed");				PowerupDisplay.Push("Fast");
		PowerupNames.Push("PowerFlight");				PowerupDisplay.Push("Flight");
		PowerupNames.Push("PowerInvisibility");			PowerupDisplay.Push("Hidden");
		PowerupNames.Push("PowerGhost");				PowerupDisplay.Push("Hidden");
		PowerupNames.Push("PowerShadow");				PowerupDisplay.Push("Hidden");
		PowerupNames.Push("PowerInvulnerable");			PowerupDisplay.Push("Immune");
		PowerupNames.Push("PowerLightamp");				PowerupDisplay.Push("Light");
		PowerupNames.Push("PowerTorch");				PowerupDisplay.Push("Light");
		PowerupNames.Push("PowerWeaponlevel2");			PowerupDisplay.Push("Power");
		PowerupNames.Push("PowerMinotaur");				PowerupDisplay.Push("Ally");
		PowerupNames.Push("PowerIronfeet");				PowerupDisplay.Push("Suit");
		PowerupNames.Push("PowerMask");					PowerupDisplay.Push("Suit");
		PowerupNames.Push("PowerTargeter");				PowerupDisplay.Push("Target");
		return;
	}
}