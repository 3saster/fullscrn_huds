extend Class SpecialHexenStatusBar
{
	enum FontValues
	{
		OLDFONT = 0,
		NEWCONFONT = 1,
		SMALLFNT = 2,
		STATREPORT = 3,
		MEMENTWO = 4
	}
	
	struct StatFont
	{
		Font fnt; // The Font
		int tHeight; // Height from top (for top-left and top-right)
		int[2] bHeightL; // Height from bottom on left (for bottom-left and bottom-right). [0] is for unsplit, [1] is for split
		int[2] bHeightR; // Height from bottom on right (for bottom-left and bottom-right). [0] is for unsplit, [1] is for split
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
			s.bHeightL[0] = 50; s.bHeightL[1] = 39;
			s.bHeightR[0] = 50; s.bHeightR[1] = 39;
			s.scale = (320,200);
			s.padding = 0;
			s.sPush = 1;
			s.vspace = 1;
			break;
		case NEWCONFONT:
			s.fnt = NewConsoleFont;
			s.tHeight = 2;
			s.bHeightL[0] = 102; s.bHeightL[1] = 80;
			s.bHeightR[0] = 102; s.bHeightR[1] = 80;
			s.scale = (650,400);
			s.padding = 0;
			s.sPush = 2;
			s.vspace = -3;
			break;
		case SMALLFNT:
			s.fnt = SMALLFONT;
			s.tHeight = 2;
			s.bHeightL[0] = 76; s.bHeightL[1] = 59;
			s.bHeightR[0] = 76; s.bHeightR[1] = 59;
			s.scale = (580,300);
			s.padding = 0;
			s.sPush = 2;
			s.vspace = -3;
			break;
		case STATREPORT:
			s.fnt = "STATUSRP";
			s.tHeight = 1;
			s.bHeightL[0] = 50; s.bHeightL[1] = 39;
			s.bHeightR[0] = 50; s.bHeightR[1] = 39;
			s.scale = (460,200);
			s.padding = 0;
			s.sPush = 1;
			s.vspace = 0;
			break;
		case MEMENTWO:
			s.fnt = "MM2FONTO";
			s.tHeight = 2;
			s.bHeightL[0] = 101; s.bHeightL[1] = 79;
			s.bHeightR[0] = 101; s.bHeightR[1] = 79;
			s.scale = (800,400);
			s.padding = 10;
			s.sPush = 2;
			s.vspace = 2;
			break;
		}
	}
}