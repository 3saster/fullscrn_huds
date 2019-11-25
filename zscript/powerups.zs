mixin Class PowerupValues
{
	Array<String> PowerupNames;   // Actual Name of the powerup
	Array<String> PowerupDisplay; // Name to display on stats
	// =============================
	// Get Powerup Names and Strings
	// =============================
	// Special thanks to Tekish's Levelinfo, since this saved me a lot of time
	void setPowerupNames()
	{
		let pclass = CPlayer.mo.GetClassName();
		string s; // Use this to avoid error on startup
		// Argent
		if (pclass == "ArgPlayer")
		{
			// PowerupNames.Push("PowerStrength");		PowerupDisplay.Push("Berserk");
			PowerupNames.Push("ArgPowerHasteSpeed");	PowerupDisplay.Push("Speed");
			PowerupNames.Push("PowerInvisibility");		PowerupDisplay.Push("Hidden");
			PowerupNames.Push("ArgPowerInvuln");		PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerLightamp");		PowerupDisplay.Push("Light");
			PowerupNames.Push("ArgPowerQuadDamage");	PowerupDisplay.Push("Quad");
			PowerupNames.Push("ArgPowerRegen");		PowerupDisplay.Push("Regen");
			PowerupNames.Push("PowerIronfeet");		PowerupDisplay.Push("Suit");
			return;
		}

		// Ashes 2063
		if (pclass == "Scavenger")
		{
			PowerupNames.Push("PowerInvulnerable");		PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerDoubleFiringSpeed");	PowerupDisplay.Push("Rage");
			PowerupNames.Push("PowerRegeneration");		PowerupDisplay.Push("Regen");
			PowerupNames.Push("PowerIronfeet");		PowerupDisplay.Push("Suit");
			return;
		}

		// Brutal Doom
		s = "IsNOTTacticalClass";
		if (pclass == "BDoomer" || pclass == "Doomer2" || pclass == "TacticalDoomer" || (pclass == "Purist" && CPlayer.mo.findinventory(s)))
		{
			// PowerupNames.Push("PowerStrength");		PowerupDisplay.Push("Berserk");
			PowerupNames.Push("PowerInvisibility");		PowerupDisplay.Push("Hidden");
			PowerupNames.Push("PowerInvulnerable");		PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerTransformBaron");	PowerupDisplay.Push("Morph");
			PowerupNames.Push("PowerTransformRevenant");	PowerupDisplay.Push("Morph");
			PowerupNames.Push("PowerTorch");		PowerupDisplay.Push("Light");
			PowerupNames.Push("PowerIronfeet");		PowerupDisplay.Push("Suit");
			return;
		}

		// Death Foretold
		if (pclass == "Doom4Player")
		{
			PowerupNames.Push("PowerD4Strength");		PowerupDisplay.Push("Berserk");
			PowerupNames.Push("PowerD4Speed");		PowerupDisplay.Push("Speed");
			PowerupNames.Push("PowerD4Invisibility");	PowerupDisplay.Push("Hidden");
			PowerupNames.Push("PowerD4Invulnerable");	PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerLightamp");		PowerupDisplay.Push("Light");
			PowerupNames.Push("PowerQDamage");		PowerupDisplay.Push("Quad");
			PowerupNames.Push("PowerD4Regeneration");	PowerupDisplay.Push("Regen");
			PowerupNames.Push("PowerD4IronFeet");		PowerupDisplay.Push("Suit");
			return;
		}

		// Doom 64 Retribution
		s = "Stamina";
		if (pclass == "64DoomPlayer" && !CPlayer.mo.findinventory(s))
		{
			// PowerupNames.Push("PowerStrength");		PowerupDisplay.Push("Berserk");
			PowerupNames.Push("PowerInvisibility");		PowerupDisplay.Push("Hidden");
			PowerupNames.Push("PowerInvulnerable");		PowerupDisplay.Push("Immune");
			PowerupNames.Push("64PowerLightAmp");		PowerupDisplay.Push("Light");
			PowerupNames.Push("PowerIronfeet");		PowerupDisplay.Push("Suit");
			return;
		}

		// Doom Incarnate
		if (pclass == "CaptainBlazkowicz")
		{
			PowerupNames.Push("PowerWrath");		PowerupDisplay.Push("Berserk");
			PowerupNames.Push("PowerPsyche");		PowerupDisplay.Push("Hidden");
			PowerupNames.Push("PowerBattleSuit");		PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerLightamp");		PowerupDisplay.Push("Light");
			PowerupNames.Push("PowerQuadDamage");		PowerupDisplay.Push("Quad");
			PowerupNames.Push("PowerQ3Regeneration");	PowerupDisplay.Push("Regen");
			PowerupNames.Push("PowerIronfeet");		PowerupDisplay.Push("Suit");
			return;
		}

		// Flakes Doom
		s = "FirstTimeShotgunning";
		if (pclass == "FKPlayer" && CPlayer.mo.findinventory(s))
		{
			PowerupNames.Push("PowerHaste");		PowerupDisplay.Push("Speed");
			PowerupNames.Push("PowerInvisibility");		PowerupDisplay.Push("Hidden");
			PowerupNames.Push("PowerInvulnerable");		PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerLightAmp");		PowerupDisplay.Push("Light");
			PowerupNames.Push("PowerQuadDamage");		PowerupDisplay.Push("Quad");
			PowerupNames.Push("PowerIronfeet");		PowerupDisplay.Push("Suit");
			return;
		}

		// Project Brutality
		s = "IsNOTTacticalClass";
		if (pclass == "BrutalDoomer" || pclass == "Traditional" || (pclass == "Purist" && !CPlayer.mo.findinventory(s)))
		{
			// PowerupNames.Push("PowerStrength");		PowerupDisplay.Push("Berserk");
			PowerupNames.Push("PowerDoubleDamage");		PowerupDisplay.Push("Damage");
			PowerupNames.Push("PowerSpeed");		PowerupDisplay.Push("Speed");
			PowerupNames.Push("PowerInvisibility");		PowerupDisplay.Push("Hidden");
			PowerupNames.Push("PowerInvulnerable");		PowerupDisplay.Push("Immune");
			PowerupNames.Push("PowerLightAmp");		PowerupDisplay.Push("Light");
			PowerupNames.Push("DemonVision");		PowerupDisplay.Push("Morph");
			PowerupNames.Push("PowerDoubleFiringSpeed");	PowerupDisplay.Push("Rage");
			PowerupNames.Push("PowerTimeFreezer");		PowerupDisplay.Push("Time");
			PowerupNames.Push("PowerIronfeet");		PowerupDisplay.Push("Suit");
			return;
		}

		// Doom
		// PowerupNames.Push("PowerStrength");      PowerupDisplay.Push("Berserk"); // Berserk (Doom)
		PowerupNames.Push("PowerInvisibility");  PowerupDisplay.Push("Hidden");   // BlurSphere (Doom)
		PowerupNames.Push("PowerLightamp");      PowerupDisplay.Push("Light");  // Infrared (Doom)
		PowerupNames.Push("PowerIronfeet");      PowerupDisplay.Push("Suit");   // Radsuit (Doom)
		// Heretic
		PowerupNames.Push("PowerGhost");         PowerupDisplay.Push("Ghost");  // ArtiInvisibility (Heretic)
		PowerupNames.Push("PowerWeaponlevel2");  PowerupDisplay.Push("Power");  // ArtiTomeOfPower (Heretic)
		// Hexen
		PowerupNames.Push("PowerMinotaur");      PowerupDisplay.Push("Ally");   // ArtiDarkServant (Hexen)
		PowerupNames.Push("PowerSpeed");         PowerupDisplay.Push("Speed");  // ArtiSpeedBoots (Hexen)
		// Strife
		PowerupNames.Push("PowerShadow");        PowerupDisplay.Push("Shadow"); // ShadowArmor (Strife)
		PowerupNames.Push("PowerMask");          PowerupDisplay.Push("Suit");   // EnvironmentalSuit (Strife)
		PowerupNames.Push("PowerTargeter");      PowerupDisplay.Push("Target"); // Targeter (Strife)
		PowerupNames.Push("PowerScanner");       PowerupDisplay.Push("Scan");   // Scanner (Strife)
		// Shared
		PowerupNames.Push("PowerInvulnerable"); PowerupDisplay.Push("Immune"); // InvulnerabilitySphere (Doom), ArtiInvulnerability/ArtiInvulnerability2 (Heretic/Hexen)
		if(!level.infinite_flight)
		{
			PowerupNames.Push("PowerFlight"); PowerupDisplay.Push("Flight"); // ArtiFly (Heretic/Hexen)
		}
		PowerupNames.Push("PowerTorch"); PowerupDisplay.Push("Torch"); // ArtiTorch (Heretic/Hexen)
		PowerupNames.Push("PowerMorph"); PowerupDisplay.Push("Morph"); // Chicken/Pig morph (Heretic/Hexen)
		return;
	}
}