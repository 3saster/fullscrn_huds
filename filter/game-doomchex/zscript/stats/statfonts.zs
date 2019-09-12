extend Class SpecialDoomStatusBar
{
	enum FontValues
	{
		OLDFONT = 0,
		NEWCONFONT = 1,
		STATREPORT = 2,
		MEMENTWO = 3
	}
	
	struct StatFont
	{
		Font fnt; // The Font
		int tHeight; // Height from top (for top-left and top-right)
		int bHeight; // Height from bottom (for bottom-left and bottom-right)
		int sPush; // Push from edge of screen
		vector2 scale; // Scaling for the text; larger x-values shrink horizontally, larger y-values shrink vertically
		int padding; // Space padding to add
		int vspace; // Space between stats
	}
	
	void GetStatFont(out statFont s)
	{
		switch(statsFont.GetInt())
		{
		default:
		case OLDFONT:
			s.fnt = "OLDFONT";
			s.tHeight = 2;
			s.bHeight = 39;
			s.scale = (320,200);
			s.padding = 0;
			s.sPush = 1;
			s.vspace = 1;
			break;
		case NEWCONFONT:
			s.fnt = NewConsoleFont;
			s.tHeight = 2;
			s.bHeight = 80;
			s.scale = (650,400);
			s.padding = 0;
			s.sPush = 1;
			s.vspace = -3;
			break;
		case STATREPORT:
			s.fnt = "STATUSRP";
			s.tHeight = 1;
			s.bHeight = 39;
			s.scale = (460,200);
			s.padding = 6;
			s.sPush = 1;
			s.vspace = 0;
			break;
		case MEMENTWO:
			s.fnt = "MM2FONTO";
			s.tHeight = 2;
			s.bHeight = 79;
			s.scale = (800,400);
			s.padding = 10;
			s.sPush = 2;
			s.vspace = 2;
			break;
		}
	}
}