extend Class SpecialHereticStatusBar
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

		// Doom, Heretic, Hexen, Strife
		// PowerupNames.Push("PowerStrength");			PowerupDisplay.Push("Berserk");
		PowerupNames.Push("PowerScanner");			PowerupDisplay.Push("Detect");
		PowerupNames.Push("PowerSpeed");			PowerupDisplay.Push("Speed");
		PowerupNames.Push("PowerFlight");			PowerupDisplay.Push("Flight");
		PowerupNames.Push("PowerInvisibility");			PowerupDisplay.Push("Blur");
		PowerupNames.Push("PowerGhost");			PowerupDisplay.Push("Blur");
		PowerupNames.Push("PowerShadow");			PowerupDisplay.Push("Blur");
		PowerupNames.Push("PowerInvulnerable");			PowerupDisplay.Push("God");
		PowerupNames.Push("PowerLightamp");			PowerupDisplay.Push("Light");
		PowerupNames.Push("PowerTorch");			PowerupDisplay.Push("Light");
		PowerupNames.Push("PowerWeaponlevel2");			PowerupDisplay.Push("Power");
		PowerupNames.Push("PowerMinotaur");			PowerupDisplay.Push("Ally");
		PowerupNames.Push("PowerIronfeet");			PowerupDisplay.Push("Suit");
		PowerupNames.Push("PowerMask");				PowerupDisplay.Push("Suit");
		PowerupNames.Push("PowerTargeter");			PowerupDisplay.Push("Target");
		return;
	}
}