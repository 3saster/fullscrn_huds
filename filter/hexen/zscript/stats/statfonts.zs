extend Class SpecialHexenStatusBar
{
	enum FontValues
	{
		OLDFONT = 0,
		NEWCONFONT = 1,
		STATREPORT = 2,
		MM2 = 3,
		SOLIDFONT = 4,
		ZDOOM = 5
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
			s.bHeightL[0] = 100; s.bHeightL[1] = 79;
			s.bHeightR[0] = 100; s.bHeightR[1] = 79;
			s.scale = (650,400);
			s.padding = 0;
			s.sPush = 2;
			s.vspace = -3;
			break;
		case STATREPORT:
			s.fnt = "STATBGGS";
			s.tHeight = 2; 
			s.bHeightL[0] = 100; s.bHeightL[1] = 78;
			s.bHeightR[0] = 100; s.bHeightR[1] = 78;
			s.scale = (640,400);
			s.padding = 0;
			s.sPush = 2;
			s.vspace = 1;
			break;
		case MM2:
			s.fnt = "MM2FONTO";
			s.tHeight = 2;
			s.bHeightL[0] = 110; s.bHeightL[1] = 88;
			s.bHeightR[0] = 110; s.bHeightR[1] = 88;
			s.scale = (700,450);
			s.padding = 10;
			s.sPush = 2;
			s.vspace = 1;
			break;
		case SOLIDFONT:
			s.fnt = "SOLID";
			s.tHeight = 2;
			s.bHeightL[0] = 110; s.bHeightL[1] = 88;
			s.bHeightR[0] = 110; s.bHeightR[1] = 88;
			s.scale = (910,450);
			s.padding = 10;
			s.sPush = 2;
			s.vspace = 1;
			break;
		case ZDOOM:
			s.fnt = "ZDOOM";
			s.tHeight = 2;
			s.bHeightL[0] = 110; s.bHeightL[1] = 92;
			s.bHeightR[0] = 110; s.bHeightR[1] = 92;
			s.scale = (910,450);
			s.padding = 10;
			s.sPush = 2;
			s.vspace = 1;
			break;
		}
	}
}