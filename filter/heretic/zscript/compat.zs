extend Class SpecialHereticStatusBar
{
	mixin CompatFunctions;
	mixin PowerupValues;

	// ===================================
	// Special HUDS for certain PWADS/mods
	// ===================================
	void setBARBACKNames()
	{
		// Defaults
		SMALLIN = "SMALLIN";
		SMALLGR = "SMALLGR";

		BARBACK = "BARBACK";
		LTFCTOP = "LTFCTOP";
		RTFCTOP = "RTFCTOP";
		GOD1    = "GOD1";
		GOD2    = "GOD2";

		// Deal with compatibility with certain PWADS
		switch(BARBACK_HASH)
		{
		case 0x8E87BB56: // Heretic Neural Texture Pack
			BARBACK = "BARBACK_NEURAL";
			LTFCTOP = "LTFCTOP_NEURAL";
			RTFCTOP = "RTFCTOP_NEURAL";
			GOD1    = "GOD1_NEURAL";
			GOD2    = "GOD2_NEURAL";
			break;
		}
	}
}