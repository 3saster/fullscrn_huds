mixin Class Stats
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
		NONE = 0,
		BLACK = 1,
		LIGHTBLUE = 2,
		BLUE = 3,
		BRICK = 4,
		BROWN = 5,
		DARKBROWN = 6,
		CREAM = 7,
		CYAN = 8,
		FIRE = 9,
		GOLD = 10,
		DARKGRAY = 11, 
		GREEN = 12,
		DARKGREEN = 13, 
		OLIVE = 14,
		ORANGE = 15,
		PURPLE = 16,
		RED = 17,
		DARKRED = 18, 
		SAPPHIRE = 19,
		TEAL = 20,
		YELLOW = 21
	}
	
	enum StatsPosition
	{
		OFF = 0,
		TOPLEFT = 1,
		TOPRIGHT = 2,
		CENTERLEFT = 3,
		CENTERRIGHT = 4,
		BOTTOMLEFT = 5,
		BOTTOMRIGHT = 6
	}

	DynamicValueInterpolator siKillsP;
	DynamicValueInterpolator siSecretsP;
	DynamicValueInterpolator siItemsP;
	DynamicValueInterpolator siKillsC;
	DynamicValueInterpolator siSecretsC;
	DynamicValueInterpolator siItemsC;
	DynamicValueInterpolator siKillsF;
	DynamicValueInterpolator siSecretsF;
	DynamicValueInterpolator siItemsF;

	// ===========================
	// Functions for interpolators
	// ===========================
	string prevTickMap;

	void statInit()
	{
		siKillsP   = DynamicValueInterpolator.Create(0, 0.25, 1, 100000);
		siSecretsP = DynamicValueInterpolator.Create(0, 0.25, 1, 100000);
		siItemsP   = DynamicValueInterpolator.Create(0, 0.25, 1, 100000);

		siKillsC   = DynamicValueInterpolator.Create(Level.total_monsters, 0.25, 1, 100000);
		siSecretsC = DynamicValueInterpolator.Create(Level.total_secrets,  0.25, 1, 100000);
		siItemsC   = DynamicValueInterpolator.Create(Level.total_items,    0.25, 1, 100000);

		siKillsF   = DynamicValueInterpolator.Create(0, 0.25, 1, 100000);
		siSecretsF = DynamicValueInterpolator.Create(0, 0.25, 1, 100000);
		siItemsF   = DynamicValueInterpolator.Create(0, 0.25, 1, 100000);
	}

	void statNewGame()
	{
		// Act as if entering new map
		prevTickMap = "";
	}

	void statTick()
	{
		int mkilled   = multiplayer? CPlayer.killcount : Level.killed_monsters;
		int sfound    = multiplayer? CPlayer.secretcount : Level.found_secrets;
		int ifound    = multiplayer? CPlayer.itemcount : Level.found_items;

		//Reset if new level
		if(level.MapName != prevTickMap)
		{
			// PERCENT
			// Take care of division by zero here
			siKillsP  .Reset(Level.total_monsters ? 100*mkilled/Level.total_monsters : 100);
			siSecretsP.Reset(Level.total_secrets  ? 100*sfound/Level.total_secrets   : 100);
			siItemsP  .Reset(Level.total_items    ? 100*ifound/Level.total_items     : 100);

			// COUNTDOWN
			siKillsC  .Reset(Level.total_monsters - mkilled);
			siSecretsC.Reset(Level.total_secrets  - sfound);
			siItemsC  .Reset(Level.total_items    - ifound);

			// FRACTION
			siKillsF  .Reset(mkilled);
			siSecretsF.Reset(sfound);
			siItemsF  .Reset(ifound);

			prevTickMap = level.MapName;
		}
		else
		{
			// PERCENT
			// Take care of division by zero here
			siKillsP  .Update(Level.total_monsters ? 100*mkilled/Level.total_monsters : 100);
			siSecretsP.Update(Level.total_secrets  ? 100*sfound/Level.total_secrets   : 100);
			siItemsP  .Update(Level.total_items    ? 100*ifound/Level.total_items     : 100);

			// COUNTDOWN
			siKillsC  .Update(Level.total_monsters - mkilled);
			siSecretsC.Update(Level.total_secrets  - sfound);
			siItemsC  .Update(Level.total_items    - ifound);

			// FRACTION
			siKillsF  .Update(mkilled);
			siSecretsF.Update(sfound);
			siItemsF  .Update(ifound);
		}
	}

	// =====================================================
	// The Main Functions for Drawing Stats
	// =====================================================
	void DrawStatLine(statFont sfnt, int cr, Vector2 pos, String text, double alpha)
	{
		Vector2 scale = GetHUDScale();
		
		// These values are jury-rigged; they were initially designed for my personal settings before becoming generic
		int VirtualWidth  = int(sfnt.scale.x * 6.0/scale.x * Screen.GetWidth() /2560);
		int VirtualHeight = int(sfnt.scale.y * 7.2/scale.y * Screen.GetHeight()/1440);
		
		int posX = int( pos.x >= 0 ? pos.x : VirtualWidth  + pos.x );
		int posY = int( pos.y >= 0 ? pos.y : VirtualHeight + pos.y );

		screen.DrawText(sfnt.fnt, cr, posX, posY, text, 
			DTA_KeepRatio, true,
			DTA_VirtualWidth, VirtualWidth, DTA_VirtualHeight, VirtualHeight, DTA_Alpha, alpha);
	}
	
	protected virtual void DrawLevelStats (statFont sfnt, int state = HUD_StatusBar)
	{
		int alphaO = alphaOpaque.GetInt();
		double alphaFloat = alphaO == OP_NUM || alphaO == OP_NUMGRAPH ? 1 : 1-alphaValue.getfloat();
		
		let fnt = sfnt.fnt;
		int padding = sfnt.padding;
		
		int compColor;
		switch(statsCompColor.GetInt())
		{
			case NONE:
			default:
				compColor = Font.CR_WHITE;
				break;
			case BLACK:
				compColor = Font.CR_BLACK;
				break;
			case LIGHTBLUE:
				compColor = Font.CR_LIGHTBLUE;
				break;
			case BLUE:
				compColor = Font.CR_BLUE;
				break;
			case BRICK:
				compColor = Font.CR_BRICK;
				break;
			case BROWN:
				compColor = Font.CR_BROWN;
				break;
			case DARKBROWN:
				compColor = Font.CR_DARKBROWN;
				break;
			case CREAM:
				compColor = Font.CR_CREAM;
				break;
			case CYAN:
				compColor = Font.CR_CYAN;
				break;
			case FIRE:
				compColor = Font.CR_FIRE;
				break;
			case GOLD:
				compColor = Font.CR_GOLD;
				break;
			case DARKGRAY:
				compColor = Font.CR_DARKGRAY;
				break;
			case GREEN:
				compColor = Font.CR_GREEN;
				break;
			case DARKGREEN:
				compColor = Font.CR_DARKGREEN;
				break;
			case OLIVE:
				compColor = Font.CR_OLIVE;
				break;
			case ORANGE:
				compColor = Font.CR_ORANGE;
				break;
			case PURPLE:
				compColor = Font.CR_PURPLE;
				break;
			case RED:
				compColor = Font.CR_RED;
				break;
			case DARKRED:
				compColor = Font.CR_DARKRED;
				break;
			case SAPPHIRE:
				compColor = Font.CR_SAPPHIRE;
				break;
			case TEAL:
				compColor = Font.CR_TEAL;
				break;
			case YELLOW:
				compColor = Font.CR_YELLOW;
				break;
		}
		
		string kills = "";
		string secrets = "";
		string items = "";
		string time = "";

		int mkilled   = multiplayer? CPlayer.killcount   : Level.killed_monsters;
		int sfound    = multiplayer? CPlayer.secretcount : Level.found_secrets;
		int ifound    = multiplayer? CPlayer.itemcount   : Level.found_items;
		
		// Format based on type specified
		bool killComp = false;
		bool secretComp = false;
		bool itemComp = false;
		string killstring   = (gameinfo.gametype & GAME_Chex) ? 
		                      Stringtable.Localize("$FULLHUD_KILLS_CHEX") : 
							  Stringtable.Localize("$FULLHUD_KILLS");
		string secretstring = Stringtable.Localize("$FULLHUD_SECRETS");
		string itemstring   = Stringtable.Localize("$FULLHUD_ITEMS");
		switch(statsType.GetInt())
		{
			case PERCENT:
				if (statKills.GetInt())   kills   = string.format("%s: %i%%", killstring,   siKillsP.GetValue());
				if (statSecrets.GetInt()) secrets = string.format("%s: %i%%", secretstring, siSecretsP.GetValue());
				if (statItems.GetInt())   items   = string.format("%s: %i%%", itemstring,   siItemsP.GetValue());

				if (siKillsP.GetValue()   == 100) killComp = true;
				if (siSecretsP.GetValue() == 100) secretComp = true;
				if (siItemsP.GetValue()   == 100) itemComp = true;
				break;
				
			case COUNTDOWN:
				string space = string.format(string.format("%%%ds",padding), padding ? "" : " ");
				string leftstring = Stringtable.Localize("$FULLHUD_LEFT_STRING");
				if (statKills.GetInt())   kills   = string.format("%s: %i%s%s", killstring,   siKillsC.GetValue(),   space, leftstring);
				if (statSecrets.GetInt()) secrets = string.format("%s: %i%s%s", secretstring, siSecretsC.GetValue(), space, leftstring);
				if (statItems.GetInt())   items   = string.format("%s: %i%s%s", itemstring,   siItemsC.GetValue(),   space, leftstring);

				if (siKillsC.GetValue()   == 0) killComp = true;
				if (siSecretsC.GetValue() == 0) secretComp = true;
				if (siItemsC.GetValue()   == 0) itemComp = true;
				break;
				
			case FRACTION:
				if (statKills.GetInt())   kills   = string.format("%s: %i/%i", killstring,   siKillsF.GetValue(),   Level.total_monsters);
				if (statSecrets.GetInt()) secrets = string.format("%s: %i/%i", secretstring, siSecretsF.GetValue(), Level.total_secrets);
				if (statItems.GetInt())   items   = string.format("%s: %i/%i", itemstring,   siItemsF.GetValue(),   Level.total_items);

				if (siKillsF.GetValue()   == Level.total_monsters) killComp = true;
				if (siSecretsF.GetValue() == Level.total_secrets)  secretComp = true;
				if (siItemsF.GetValue()   == Level.total_items)    itemComp = true;
				break;
		}
		// Format Level time
		int hubtime = Level.time/Thinker.TICRATE;
		if (statTime.GetInt()) time = string.format("%02d:%02d:%02d",hubtime/3600,(hubtime/60)%60,hubtime%60);
		
		// Format Powerups
		Array<String> PowerupStrings;
		int powerlength = 0;
		let pmo = CPlayer.mo;
		for(int i = 0; i < PowerupNames.size(); i++)
		{
			let inv = Powerup(pmo.FindInventory(PowerupNames[i]));
			if( inv && inv.EffectTics > 0)
			{
				string s = string.format("%s: %02d:%02d",StringTable.Localize(PowerupDisplay[i]),inv.EffectTics/Thinker.TICRATE/60, inv.EffectTics/Thinker.TICRATE%60);
				PowerupStrings.push(s);
				powerlength = max(powerlength, fnt.StringWidth(s));
			}
		}
		// Morphed Timers
		String morphString = "";
		int morphtics; String morphname;
		[morphtics, morphname] = GetMorphTics();
		if(morphtics > 0)
		{
			morphString = string.format("%s: %02d:%02d",StringTable.Localize(morphname),morphtics/Thinker.TICRATE/60, morphtics/Thinker.TICRATE%60);
			PowerupStrings.push(morphString);
			powerlength = max(powerlength, fnt.StringWidth(morphString));
		}

		int textSize = fnt.GetHeight() + sfnt.vspace;
		int killpos   = statsType.GetInt() ? statKills.getInt()    : OFF;
		int secretpos = statsType.GetInt() ? statSecrets.getInt()  : OFF;
		int itempos   = statsType.GetInt() ? statItems.getInt()    : OFF;
		int timepos   = statsType.GetInt() ? statTime.getInt()     : OFF;
		int powerpos  = statsType.GetInt() ? statPowerups.getInt() : OFF;
		
		// Make each block have the same length
		int maxlength[7] = {0,0,0,0,0,0,0};
		maxlength[killpos]   = max(maxlength[killpos],  fnt.StringWidth(kills));
		maxlength[secretpos] = max(maxlength[secretpos],fnt.StringWidth(secrets));
		maxlength[itempos]   = max(maxlength[itempos],  fnt.StringWidth(items));
		maxlength[powerpos]  = max(maxlength[powerpos], powerlength);
		
		kills =   makeLength(kills,  fnt, maxlength[killpos]   + padding);
		secrets = makeLength(secrets,fnt, maxlength[secretpos] + padding);
		items =   makeLength(items,  fnt, maxlength[itempos]   + padding);
		for(int i = 0; i < PowerupStrings.size(); i++)
			PowerupStrings[i] = makeLength(PowerupStrings[i],  fnt, maxlength[powerpos] + padding, ": ");
		morphString = makeLength(morphString, fnt, maxlength[powerpos] + padding, ": ");
		
		int sPush = sfnt.sPush;
		int tHeight = sfnt.tHeight;
		Vector2 scale = GetHUDScale();
		int VirtualHeight = int(sfnt.scale.y * 7.2/scale.y * Screen.GetHeight()/1440);
		// Top Left
		int topLeftTotal = 0;
		if(killpos   == TOPLEFT) DrawStatLine(sfnt, killComp   ? compColor : Font.CR_WHITE, (sPush,tHeight+textSize*topLeftTotal++) ,kills,alphaFloat);
		if(secretpos == TOPLEFT) DrawStatLine(sfnt, secretComp ? compColor : Font.CR_WHITE, (sPush,tHeight+textSize*topLeftTotal++) ,secrets,alphaFloat);
		if(itempos   == TOPLEFT) DrawStatLine(sfnt, itemComp   ? compColor : Font.CR_WHITE, (sPush,tHeight+textSize*topLeftTotal++) ,items,alphaFloat);
		if(timepos   == TOPLEFT) DrawStatLine(sfnt,                          Font.CR_WHITE, (sPush,tHeight+textSize*topLeftTotal++) ,time,alphaFloat);
		if(powerpos  == TOPLEFT)
			for(int i = 0; i < PowerupStrings.size(); i++)	
				DrawStatLine(sfnt, (PowerupStrings[i] == morphString) ? Font.CR_ORANGE : Font.CR_YELLOW,
				(sPush,tHeight+textSize*topLeftTotal++), PowerupStrings[i],alphaFloat);
		// Top Right
		// This needs special handling for vid_fps
		int conOffset = vid_fps ? GetConSize() * VirtualHeight/Screen.GetHeight() : 0;
		topRightTotal = 0;
		if(killpos   == TOPRIGHT) DrawStatLine(sfnt, killComp   ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(kills),  conOffset+tHeight+textSize*topRightTotal++)  ,kills,alphaFloat);
		if(secretpos == TOPRIGHT) DrawStatLine(sfnt, secretComp ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(secrets),conOffset+tHeight+textSize*topRightTotal++),secrets,alphaFloat);
		if(itempos   == TOPRIGHT) DrawStatLine(sfnt, itemComp   ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(items),  conOffset+tHeight+textSize*topRightTotal++)  ,items,alphaFloat);
		if(timepos   == TOPRIGHT) DrawStatLine(sfnt,                          Font.CR_WHITE, (-sPush-fnt.StringWidth(time),   conOffset+tHeight+textSize*topRightTotal++)   ,time,alphaFloat);
		if(powerpos  == TOPRIGHT)
			for(int i = 0; i < PowerupStrings.size(); i++)	
				DrawStatLine(sfnt, (PowerupStrings[i] == morphString) ? Font.CR_ORANGE : Font.CR_YELLOW,
				(-sPush-fnt.StringWidth(PowerupStrings[i]),conOffset+tHeight+textSize*topRightTotal++), PowerupStrings[i],alphaFloat);
		// Center Left
		int clTotal = 0;
		if(itempos   == CENTERLEFT) clTotal++;
		if(secretpos == CENTERLEFT) clTotal++;
		if(killpos   == CENTERLEFT) clTotal++;
		if(timepos   == CENTERLEFT) clTotal++;
		if(powerpos  == CENTERLEFT) clTotal += PowerupStrings.size();
		int clHeight = VirtualHeight/2 - textSize/2*clTotal;
		int centerLeftTotal = 0;
		if(killpos   == CENTERLEFT) DrawStatLine(sfnt, killComp   ? compColor : Font.CR_WHITE, (sPush,clHeight+textSize*centerLeftTotal++) ,kills,alphaFloat);
		if(secretpos == CENTERLEFT) DrawStatLine(sfnt, secretComp ? compColor : Font.CR_WHITE, (sPush,clHeight+textSize*centerLeftTotal++) ,secrets,alphaFloat);
		if(itempos   == CENTERLEFT) DrawStatLine(sfnt, itemComp   ? compColor : Font.CR_WHITE, (sPush,clHeight+textSize*centerLeftTotal++) ,items,alphaFloat);
		if(timepos   == CENTERLEFT) DrawStatLine(sfnt,                          Font.CR_WHITE, (sPush,clHeight+textSize*centerLeftTotal++) ,time,alphaFloat);
		if(powerpos  == CENTERLEFT)
			for(int i = 0; i < PowerupStrings.size(); i++)	
				DrawStatLine(sfnt, (PowerupStrings[i] == morphString) ? Font.CR_ORANGE : Font.CR_YELLOW,
				(sPush,clHeight+textSize*centerLeftTotal++), PowerupStrings[i],alphaFloat);
		// Center Right
		int crTotal = 0;
		if(itempos   == CENTERRIGHT) crTotal++;
		if(secretpos == CENTERRIGHT) crTotal++;
		if(killpos   == CENTERRIGHT) crTotal++;
		if(timepos   == CENTERRIGHT) crTotal++;
		if(powerpos  == CENTERRIGHT) crTotal += PowerupStrings.size();
		int crHeight = VirtualHeight/2 - textSize/2*crTotal;
		int centerRightTotal = 0;
		if(killpos   == CENTERRIGHT) DrawStatLine(sfnt, killComp   ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(kills),  crHeight+textSize*centerRightTotal++) ,kills,alphaFloat);
		if(secretpos == CENTERRIGHT) DrawStatLine(sfnt, secretComp ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(secrets),crHeight+textSize*centerRightTotal++) ,secrets,alphaFloat);
		if(itempos   == CENTERRIGHT) DrawStatLine(sfnt, itemComp   ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(items),  crHeight+textSize*centerRightTotal++) ,items,alphaFloat);
		if(timepos   == CENTERRIGHT) DrawStatLine(sfnt,                          Font.CR_WHITE, (-sPush-fnt.StringWidth(time),   crHeight+textSize*centerRightTotal++) ,time,alphaFloat);
		if(powerpos  == CENTERRIGHT)
			for(int i = 0; i < PowerupStrings.size(); i++)	
				DrawStatLine(sfnt, (PowerupStrings[i] == morphString) ? Font.CR_ORANGE : Font.CR_YELLOW,
				(-sPush-fnt.StringWidth(PowerupStrings[i]), crHeight+textSize*centerRightTotal++), PowerupStrings[i],alphaFloat);
		// Bottom Left
		int bottomLeftTotal = 0;
		int bHeightL =  !splitHUD.getint() || state == HUD_StatusBar  ?  sfnt.bHeightL[0] : sfnt.bHeightL[1];
		if(itempos   == BOTTOMLEFT) DrawStatLine(sfnt, itemComp   ? compColor : Font.CR_WHITE, (sPush,-bHeightL-textSize*bottomLeftTotal++) ,items,alphaFloat);
		if(secretpos == BOTTOMLEFT) DrawStatLine(sfnt, secretComp ? compColor : Font.CR_WHITE, (sPush,-bHeightL-textSize*bottomLeftTotal++) ,secrets,alphaFloat);
		if(killpos   == BOTTOMLEFT) DrawStatLine(sfnt, killComp   ? compColor : Font.CR_WHITE, (sPush,-bHeightL-textSize*bottomLeftTotal++) ,kills,alphaFloat);
		if(timepos   == BOTTOMLEFT) DrawStatLine(sfnt,                          Font.CR_WHITE, (sPush,-bHeightL-textSize*bottomLeftTotal++) ,time,alphaFloat);
		if(powerpos  == BOTTOMLEFT)
			for(int i = 0; i < PowerupStrings.size(); i++)	
				DrawStatLine(sfnt, (PowerupStrings[i] == morphString) ? Font.CR_ORANGE : Font.CR_YELLOW,
				(sPush,-bHeightL-textSize*bottomLeftTotal++), PowerupStrings[i],alphaFloat);
		// Bottom Right
		int bottomRightTotal = 0;
		int bHeightR =  !splitHUD.getint() || state == HUD_StatusBar  ?  sfnt.bHeightR[0] : sfnt.bHeightR[1];
		// Split arms block stats in Heretic, move them up in this case.
		if( (gameinfo.gametype & GAME_Heretic) && splitHUD.getint() && splitArms.getint() && state == HUD_Fullscreen)
			bHeightR += sfnt.armsOffset;
		if(itempos   == BOTTOMRIGHT) DrawStatLine(sfnt, itemComp   ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(items),  -bHeightR-textSize*bottomRightTotal++)  ,items,alphaFloat);
		if(secretpos == BOTTOMRIGHT) DrawStatLine(sfnt, secretComp ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(secrets),-bHeightR-textSize*bottomRightTotal++),secrets,alphaFloat);
		if(killpos   == BOTTOMRIGHT) DrawStatLine(sfnt, killComp   ? compColor : Font.CR_WHITE, (-sPush-fnt.StringWidth(kills),  -bHeightR-textSize*bottomRightTotal++)  ,kills,alphaFloat);
		if(timepos   == BOTTOMRIGHT) DrawStatLine(sfnt,                          Font.CR_WHITE, (-sPush-fnt.StringWidth(time),   -bHeightR-textSize*bottomRightTotal++)   ,time,alphaFloat);
		if(powerpos  == BOTTOMRIGHT)
			for(int i = 0; i < PowerupStrings.size(); i++)	
				DrawStatLine(sfnt, (PowerupStrings[i] == morphString) ? Font.CR_ORANGE : Font.CR_YELLOW,
				(-sPush-fnt.StringWidth(PowerupStrings[i]),-bHeightR-textSize*bottomRightTotal++), PowerupStrings[i],alphaFloat);
	}

	// =====================================================
	// Override to prevent powerups from blocking stats
	// =====================================================
	int topRightTotal; // This is global to make this convenient
	override void DrawPowerups ()
	{
		StatFont sfnt;
		getStatFont(sfnt);
		double textSize = (sfnt.fnt.GetHeight() + sfnt.vspace) * 200.0/sfnt.scale.y;
		int totalSize = int( textSize*topRightTotal + (topRightTotal ? sfnt.tHeight : 0) );

		Vector2 pos = (-20, POWERUPICONSIZE * 5 / 4);
		double maxpos = screen.GetWidth() / 2;
		for (let iitem = CPlayer.mo.Inv; iitem != NULL; iitem = iitem.Inv)
		{
			let item = Powerup(iitem);
			if (item != null)
			{
				let icon = item.GetPowerupIcon();
				if (icon.IsValid() && !item.IsBlinking())
				{
					// If stats overlap, move it down
					while(pos.y - POWERUPICONSIZE < totalSize )
						pos.y += textSize;
					// Each icon gets a 32x32 block.
					DrawTexture(icon, pos, DI_SCREEN_RIGHT_TOP, 1.0, (POWERUPICONSIZE, POWERUPICONSIZE));
					pos.x -= POWERUPICONSIZE;
					if (pos.x < -maxpos)
					{
						pos.x = -20;
						pos.y += (POWERUPICONSIZE) * 3 / 2;
					}
				}
			}
		}
	}

	// ===================================
	// Helper Function to get vid_fps size
	// ===================================
	int GetConSize()
	{
		bool LZDoom = isLZDoom();

		int scaleval;
		if (con_scale > 0) scaleval = !LZDoom ? (con_scale+1) / 2 : con_scale;
		else if (uiscale == 0)
		{
			// Default should try to scale to 640x400
			int vscale = screen.GetHeight() / (!LZDoom ? 800 : 400);
			int hscale = screen.GetWidth() / (!LZDoom ? 1280 : 640);
			scaleval = clamp(vscale, 1, hscale);
		}
		else scaleval = !LZDoom ? (uiscale+1) / 2 : uiscale;

		// block scales that result in something larger than the current screen.
		int vmax = screen.GetHeight() / (!LZDoom ? 400 : 200);
		int hmax = screen.GetWidth() / (!LZDoom ? 640 : 320);
		int max = MAX(vmax, hmax);
		return NewConsoleFont.GetHeight()*MAX(1, MIN(scaleval, max));
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