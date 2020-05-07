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
		LTFACE  = "LTFACE";
		RTFACE  = "RTFACE";
		LIFEBAR = "LIFEBAR";
		STATBAR = "STATBAR";
		INVBAR  = "INVBAR";
		CHAIN   = "CHAIN";

		// Deal with compatibility with certain PWADS
		switch(BARBACK_HASH)
		{
		case '2fb519e3fe1b5cc6f15f9284e35222a4': // Heretic Neural Texture Pack
			BARBACK = "BARBACK_NEURAL";
			LTFCTOP = "LTFCTOP_NEURAL";
			RTFCTOP = "RTFCTOP_NEURAL";
			GOD1    = "GOD1_NEURAL";
			GOD2    = "GOD2_NEURAL";
			break;
		case 'c8aa060df2dabd11d451598c80d190d9': // Curse of D'Sparil
			BARBACK = "BARB_CUR";
			GOD1    = "GOD1_CUR";
			GOD2    = "GOD2_CUR";
			break;
		case '331f0233f65b7094b94a68900961c3b9': // Dorks R Us (idgames 7474)
			BARBACK = "BB_DORKS";
			GOD1    = "G1_DORKS";
			GOD2    = "G2_DORKS";
			break;
		case 'acc8eb55a5d678698194d88eb76287a6': // hbelcher.WAD (idgames 8095)
			GOD1    = "";
			GOD2    = "";
			LTFCTOP = "";
			RTFCTOP = "";
			LTFACE  = "LTF_HBEL";
			RTFACE  = "RTF_HBEL";
			LIFEBAR = "LB_HBEL";
			BARBACK = "BB_HBEL";
			INVBAR  = "IB_HBEL";
			CHAIN   = "CH_HBEL";
			break;
		}
	}
}