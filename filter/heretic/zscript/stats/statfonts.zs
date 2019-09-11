extend Class SpecialHereticStatusBar
{
	enum FontValues
	{
		OLDFONT = 0,
		NEWCONFONT = 1,
		SMALLFNT = 2,
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
			s.bHeightL[0] = 48; s.bHeightL[1] = 36;
			s.bHeightR[0] = 48; s.bHeightR[1] = 39;
			s.scale = (320,200);
			s.padding = 0;
			s.sPush = 1;
			s.vspace = 1;
			break;
		case NEWCONFONT:
			s.fnt = NewConsoleFont;
			s.tHeight = 2;
			s.bHeightL[0] = 100; s.bHeightL[1] = 73;
			s.bHeightR[0] = 100; s.bHeightR[1] = 79;
			s.scale = (650,400);
			s.padding = 0;
			s.sPush = 2;
			s.vspace = -3;
			break;
		case SMALLFNT:
			s.fnt = SMALLFONT;
			s.tHeight = 2;
			s.bHeightL[0] = 74; s.bHeightL[1] = 54;
			s.bHeightR[0] = 74; s.bHeightR[1] = 58;
			s.scale = (580,300);
			s.padding = 0;
			s.sPush = 2;
			s.vspace = -3;
			break;
		}
	}
}