extend Class SpecialHereticStatusBar
{
	enum StatsTypeValues
	{
		DISABLED = 0,
		PERCENT = 1,
		COUNTDOWN = 2,
		FRACTION = 3
	}
	
	enum StatsColorValues
	{
		GREEN = 0,
		RED = 1,
		NONE = 2,
	}
	
	enum StatsPosition
	{
		OFF = 0,
		TOPLEFT = 1,
		TOPRIGHT = 2,
		BOTTOMLEFT = 3,
		BOTTOMRIGHT = 4
	}
	
	enum OpaqueValues
	{
		OP_NONE = 0,
		OP_NUM = 1,
		OP_NUMGRAPH = 2,
	}
	
	// =====================================================
	// The Main Functions for Drawing Stats
	// =====================================================
	void DrawStatLine(statFont sfnt, int cr, Vector2 pos, String text, double alpha)
	{
		Vector2 scale = GetHUDScale();
		
		// These values are jury-rigged; they were initially designed for my personal settings before becoming generic
		int VirtualWidth  = floor(sfnt.scale.x * 6.0/scale.x * Screen.GetWidth() /2560);
		int VirtualHeight = floor(sfnt.scale.y  * 7.2/scale.y * Screen.GetHeight()/1440);
		
		int posX = pos.x >= 0 ? pos.x : VirtualWidth  + pos.x;
		int posY = pos.y >= 0 ? pos.y : VirtualHeight + pos.y;

		screen.DrawText(sfnt.fnt, cr, posX, posY, text, 
			DTA_KeepRatio, true,
			DTA_VirtualWidth, VirtualWidth, DTA_VirtualHeight, VirtualHeight, DTA_Alpha, alpha);
	}
	
	protected virtual void DrawLevelStats (statFont sfnt, int state = HUD_StatusBar)
	{
		int alphaO = alphaOpaque.GetInt();
		double alphaFloat = alphaO == OP_NUM || alphaO == OP_NUMGRAPH ? 1 : 1-alphaValue.getfloat();
		
		let fnt = sfnt.fnt;
		
		int compColor;
		switch(statsCompColor.GetInt())
		{
			case GREEN:
				compColor = Font.CR_GREEN;
				break;
			case RED:
				compColor = Font.CR_RED;
				break;
			case NONE:
			default:
				compColor = Font.CR_WHITE;
				break;
		}
		
		string kills = "";
		string secrets = "";
		string items = "";
		string time = "";

		int mkilled   = multiplayer? CPlayer.killcount : Level.killed_monsters;
		int sfound    = multiplayer? CPlayer.secretcount : Level.found_secrets;
		int ifound    = multiplayer? CPlayer.itemcount : Level.found_items;
		
		// Format based on type specified
		string killstring = "Kills";
		switch(statsType.GetInt())
		{
			case PERCENT: // Take care of division by zero here
				if (statKills.GetInt())   kills   = string.format("%s: %i%%", killstring,Level.total_monsters ? 100*mkilled/Level.total_monsters : 100);
				if (statSecrets.GetInt()) secrets = string.format("Secrets: %i%%",Level.total_secrets ? 100*sfound/Level.total_secrets : 100);
				if (statItems.GetInt())   items   = string.format("Items: %i%%",  Level.total_items ? 100*ifound/Level.total_items : 100);
				break;
				
			case COUNTDOWN:
				if (statKills.GetInt())   kills   = string.format("%s: %i Left", killstring,Level.total_monsters - mkilled);
				if (statSecrets.GetInt()) secrets = string.format("Secrets: %i Left", Level.total_secrets - sfound);
				if (statItems.GetInt())   items   = string.format("Items: %i Left", Level.total_items - ifound);
				break;
				
			case FRACTION:
				if (statKills.GetInt())   kills   = string.format("%s: %i/%i",killstring,mkilled, Level.total_monsters);
				if (statSecrets.GetInt()) secrets = string.format("Secrets: %i/%i",sfound, Level.total_secrets);
				if (statItems.GetInt())   items   = string.format("Items: %i/%i",ifound, Level.total_items);
				break;
		}
		// Format Level time
		int hubtime = Level.time/Thinker.TICRATE;
		if (statTime.GetInt()) time = string.format("%02d:%02d:%02d",hubtime/3600,(hubtime/60)%60,hubtime%60);
		
		int textSize = fnt.GetHeight() + sfnt.vspace;
		int killpos = statKills.getInt();
		int secretpos = statSecrets.getInt();
		int itempos = statItems.getInt();
		int timepos = statTime.getInt();
		
		// Make each block have the same length
		int maxlength[5] = {0,0,0,0,0};
		maxlength[killpos]   = max(maxlength[killpos],  fnt.StringWidth(kills));
		maxlength[secretpos] = max(maxlength[secretpos],fnt.StringWidth(secrets));
		maxlength[itempos]   = max(maxlength[itempos],  fnt.StringWidth(items));
		
		int padding = sfnt.padding;
		kills =   makeLength(kills,  fnt, maxlength[killpos]   + padding);
		secrets = makeLength(secrets,fnt, maxlength[secretpos] + padding);
		items =   makeLength(items,  fnt, maxlength[itempos]   + padding);
		
		int sPush = sfnt.sPush;
		int tHeight = sfnt.tHeight;
		// Top Left
		int topLeftTotal = 0;
		if(killpos   == TOPLEFT) DrawStatLine(sfnt,mkilled == Level.total_monsters ? compColor : Font.CR_WHITE, (sPush,tHeight+textSize*topLeftTotal++) ,kills,alphaFloat);
		if(secretpos == TOPLEFT) DrawStatLine(sfnt,sfound == Level.total_secrets   ? compColor : Font.CR_WHITE, (sPush,tHeight+textSize*topLeftTotal++) ,secrets,alphaFloat);
		if(itempos   == TOPLEFT) DrawStatLine(sfnt,ifound == Level.total_items     ? compColor : Font.CR_WHITE, (sPush,tHeight+textSize*topLeftTotal++) ,items,alphaFloat);
		if(timepos   == TOPLEFT && statsType.GetInt()) DrawStatLine(sfnt,                        Font.CR_WHITE, (sPush,tHeight+textSize*topLeftTotal++) ,time,alphaFloat);
		// Top Right
		// This needs special handling for vid_fps
		int conOffset = vid_fps ?  GetConSize()+2 : 0;
		int topRightTotal = 0;
		if(killpos   == TOPRIGHT) DrawStatLine(sfnt,mkilled == Level.total_monsters ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(kills),  conOffset+tHeight+textSize*topRightTotal++)  ,kills,alphaFloat);
		if(secretpos == TOPRIGHT) DrawStatLine(sfnt,sfound == Level.total_secrets   ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(secrets),conOffset+tHeight+textSize*topRightTotal++),secrets,alphaFloat);
		if(itempos   == TOPRIGHT) DrawStatLine(sfnt,ifound == Level.total_items     ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(items),  conOffset+tHeight+textSize*topRightTotal++)  ,items,alphaFloat);
		if(timepos   == TOPRIGHT && statsType.GetInt()) DrawStatLine(sfnt,                        Font.CR_WHITE, (-sPush-fnt.StringWidth(time),   conOffset+tHeight+textSize*topRightTotal++)   ,time,alphaFloat);
		// Bottom Left
		int bottomLeftTotal = 0;
		int bHeightL =  !splitHUD.getint() || state == HUD_StatusBar  ?  sfnt.bHeightL[0] : sfnt.bHeightL[1];
		if(itempos   == BOTTOMLEFT) DrawStatLine(sfnt,ifound == Level.total_items     ? compColor : Font.CR_WHITE, (sPush,-bHeightL-textSize*bottomLeftTotal++) ,items,alphaFloat);
		if(secretpos == BOTTOMLEFT) DrawStatLine(sfnt,sfound == Level.total_secrets   ? compColor : Font.CR_WHITE, (sPush,-bHeightL-textSize*bottomLeftTotal++) ,secrets,alphaFloat);
		if(killpos   == BOTTOMLEFT) DrawStatLine(sfnt,mkilled == Level.total_monsters ? compColor : Font.CR_WHITE, (sPush,-bHeightL-textSize*bottomLeftTotal++) ,kills,alphaFloat);
		if(timepos   == BOTTOMLEFT && statsType.GetInt()) DrawStatLine(sfnt,                        Font.CR_WHITE, (sPush,-bHeightL-textSize*bottomLeftTotal++) ,time,alphaFloat);
		// Bottom Right
		int bottomRightTotal = 0;
		int bHeightR =  !splitHUD.getint() || state == HUD_StatusBar  ?  sfnt.bHeightR[0] : sfnt.bHeightR[1];
		if(secretpos == BOTTOMRIGHT) DrawStatLine(sfnt,sfound == Level.total_secrets   ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(secrets),-bHeightR-textSize*bottomRightTotal++),secrets,alphaFloat);
		if(itempos   == BOTTOMRIGHT) DrawStatLine(sfnt,ifound == Level.total_items     ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(items),  -bHeightR-textSize*bottomRightTotal++)  ,items,alphaFloat);
		if(killpos   == BOTTOMRIGHT) DrawStatLine(sfnt,mkilled == Level.total_monsters ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(kills),  -bHeightR-textSize*bottomRightTotal++)  ,kills,alphaFloat);
		if(timepos   == BOTTOMRIGHT && statsType.GetInt()) DrawStatLine(sfnt,   			         Font.CR_WHITE, (-sPush-fnt.StringWidth(time),   -bHeightR-textSize*bottomRightTotal++)   ,time,alphaFloat);	
	}
	
	// ===================================
	// Helper Function to get vid_fps size
	// ===================================
	int GetConSize()
	{
		int scaleval;
		if (con_scale > 0) scaleval = (con_scale+1) / 2;
		else if (uiscale == 0)
		{
			// Default should try to scale to 640x400
			int vscale = screen.GetHeight() / 800;
			int hscale = screen.GetWidth() / 1280;
			scaleval = clamp(vscale, 1, hscale);
		}
		else scaleval = (uiscale+1) / 2;

		// block scales that result in something larger than the current screen.
		int vmax = screen.GetHeight() / 400;
		int hmax = screen.GetWidth() / 640;
		int max = MAX(vmax, hmax);
		return NewConsoleFont.GetHeight()*MAX(1, MIN(scaleval, max))/4;
	}
	
	// ==========================================================
	// Helper Function to make string a specific length in a font
	// ==========================================================
	String makeLength(string input, font fnt, int length, string extender = ":")
	{
		if(fnt.StringWidth(input) > length) return input;
		
		int spacelength = (length - fnt.StringWidth(input))/fnt.StringWidth(" ");
		string replacer = string.format(string.format("%%s%%%ds",spacelength), extender, "");
		input.replace(extender,replacer);

		return input;
	}
}