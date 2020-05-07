extend Class SpecialHexenStatusBar
{
	mixin CompatFunctions;
	mixin PowerupValues;

	// ===================================
	// Special HUDS for certain PWADS/mods
	// ===================================
	void setH2BARNames()
	{
		// Defaults
		H2BAR  = "H2BAR";
		LFEDGE = "LFEDGE";
		RTEDGE = "RTEDGE";

		// Deal with compatibility with certain PWADS
		switch(H2BAR_HASH)
		{
		case '19aea9e09b3720236ba3045cfd806228': // Urban.wad (idgames 6291)
			H2BAR  = "H2B_URB";
			LFEDGE = "LFED_URB";
			RTEDGE = "RTED_URB";
			break;
		}
	}
}