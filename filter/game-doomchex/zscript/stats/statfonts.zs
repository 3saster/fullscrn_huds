extend Class SpecialDoomStatusBar
{
	mixin Stats;
	mixin StatFonts;
	
	void GetStatFont(out statFont s)
	{
		switch(statsFont.GetInt())
		{
		default:
		case OLDFONT:
			s.fnt = "OLDFONT";
			s.tHeight = 2;
			s.bHeightL[0] = 39; s.bHeightL[1] = 39;
			s.bHeightR[0] = 39; s.bHeightR[1] = 39;
			s.scale = (320,200);
			s.padding = 0;
			s.sPush = 1;
			s.vspace = 1;
			s.armsOffset = 0;
			break;
		case NEWCONFONT:
			s.fnt = "NEWCONFONT";
			s.tHeight = 2;
			s.bHeightL[0] = 77; s.bHeightL[1] = 77;
			s.bHeightR[0] = 77; s.bHeightR[1] = 77;
			s.scale = (650,400);
			s.padding = 0;
			s.sPush = 1;
			s.vspace = -1;
			s.armsOffset = 0;
			break;
		case STATREPORT:
			s.fnt = "STATUSRP";
			s.tHeight = 1;
			s.bHeightL[0] = 39; s.bHeightL[1] = 39;
			s.bHeightR[0] = 39; s.bHeightR[1] = 39;
			s.scale = (460,200);
			s.padding = 6;
			s.sPush = 1;
			s.vspace = 0;
			s.armsOffset = 0;
			break;
		case MEMENTWO:
			s.fnt = "MM2FONTO";
			s.tHeight = 2;
			s.bHeightL[0] = 78; s.bHeightL[1] = 78;
			s.bHeightR[0] = 78; s.bHeightR[1] = 78;
			s.scale = (800,400);
			s.padding = 10;
			s.sPush = 2;
			s.vspace = 2;
			s.armsOffset = 0;
			break;
		}
	}
}