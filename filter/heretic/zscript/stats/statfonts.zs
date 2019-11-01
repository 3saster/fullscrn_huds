extend Class SpecialHereticStatusBar
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
		int[2] bHeightL; // Height from bottom on left (for bottom-left and bottom-right). [0] is for unsplit, [1] is for split
		int[2] bHeightR; // Height from bottom on right (for bottom-left and bottom-right). [0] is for unsplit, [1] is for split
		int sPush; // Push from edge of screen
		vector2 scale; // Scaling for the text; larger x-values shrink horizontally, larger y-values shrink vertically
		int padding; // Space padding to add
		int vspace; // Space between stats
		int armsOffset; // Offset if arms are displayed
	}
	
	void GetStatFont(out statFont s)
	{
		switch(statsFont.GetInt())
		{
		default:
		case OLDFONT:
			s.fnt = "OLDFONT";
			s.tHeight = 2;
			s.bHeightL[0] = 49; s.bHeightL[1] = 36;
			s.bHeightR[0] = 49; s.bHeightR[1] = 39;
			s.scale = (320,200);
			s.padding = 0;
			s.sPush = 1;
			s.vspace = 1;
			s.armsOffset = 6;
			break;
		case NEWCONFONT:
			s.fnt = "NEWCONFONT";
			s.tHeight = 2;
			s.bHeightL[0] = 97; s.bHeightL[1] = 71;
			s.bHeightR[0] = 97; s.bHeightR[1] = 77;
			s.scale = (650,400);
			s.padding = 0;
			s.sPush = 2;
			s.vspace = -1;
			s.armsOffset = 13;
			break;
		case STATREPORT:
			s.fnt = "STATUSRP";
			s.tHeight = 1;
			s.bHeightL[0] = 49; s.bHeightL[1] = 36;
			s.bHeightR[0] = 49; s.bHeightR[1] = 39;
			s.scale = (460,200);
			s.padding = 6;
			s.sPush = 1;
			s.vspace = 0;
			s.armsOffset = 7;
			break;
		case MEMENTWO:
			s.fnt = "MM2FONTO";
			s.tHeight = 2;
			s.bHeightL[0] = 99; s.bHeightL[1] = 72;
			s.bHeightR[0] = 99; s.bHeightR[1] = 78;
			s.scale = (800,400);
			s.padding = 10;
			s.sPush = 2;
			s.vspace = 2;
			s.armsOffset = 12;
			break;
		}
	}
}