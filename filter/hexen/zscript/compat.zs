extend Class SpecialHexenStatusBar
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
		return;
	}
} 