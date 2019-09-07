Class SpecialDoomStatusBar : DoomStatusBar
{
	transient CVar splitHUD;
	transient CVar alphaValue;
	transient CVar alphaOpaque;
	
	transient CVAR boomColors;
	transient CVAR splitArms;
	transient CVAR invReplace;
	transient CVAR berserkShow;
	transient CVAR chexArms;
	transient CVAR automapHide;
	
	transient CVAR statsType;
	transient CVAR statsFont;
	transient CVAR statsCompColor;
	transient CVAR statKills;
	transient CVAR statSecrets;
	transient CVAR statItems;
	transient CVAR statTime;
	
	InventoryBarState diparms_sbar;
	HUDFont mIndexFontF; // For Chex
	
	enum OpaqueValues
	{
		OP_NONE = 0,
		OP_NUM = 1,
		OP_NUMGRAPH = 2,
	}
	
	override void Init()
	{
		Super.Init();
		
		splitHUD    = CVar.FindCVar("fullhud_split");
		alphaValue  = CVar.FindCVar("fullhud_trans");
		alphaOpaque = CVar.FindCVar("fullhud_opaque");
		
		boomColors  = CVar.FindCVar("fullhud_boomcolors");
		splitArms   = CVar.FindCVar("fullhud_splitarms");
		invReplace  = CVar.FindCVar("fullhud_invovermug");
		berserkShow = CVar.FindCVar("fullhud_showberserk");
		chexArms    = CVar.FindCVar("fullhud_chexarms");
		automapHide = CVar.FindCVar("fullhud_automaphide");
		
		statsType      = CVar.FindCVar("fullhud_stats_type");
		statsFont      = CVar.FindCVar("fullhud_stats_font");
		statsCompColor = CVar.FindCVar("fullhud_stats_comp");
		statKills      = CVar.FindCVar("fullhud_stats_kills");
		statSecrets    = CVar.FindCVar("fullhud_stats_secrets");
		statItems      = CVar.FindCVar("fullhud_stats_items");
		statTime       = CVar.FindCVar("fullhud_stats_time");

		diparms_sbar = InventoryBarState.CreateNoBox(mIndexFont, boxsize:(31, 31), arrowoffs:(0,-10));
		
		mIndexFontF = mIndexFont;
		// Chex has a really weird font
		if(isChex())
		{
			Font fnt = "HUDFONT_DOOM";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellCenter, 0, 0);
			
			fnt = "INDEXFONT_CHEX";
			mIndexFontF = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft);
		}

		statInit();
	}

	override void NewGame()
	{
		Super.NewGame();

		statNewGame();
	}

	override void Tick()
	{
		Super.Tick();

		statTick();
	}

	override void Draw (int state, double TicFrac)
	{
		BaseStatusBar.Draw (state, TicFrac);

		StatFont sfnt;
		getStatFont(sfnt);
		
		if (state == HUD_StatusBar)
		{
			if(!(automapactive && automapHide.GetInt()))
			{
				SetSize(32, 320, 200);
				BeginStatusBar();
				if(!automapactive) DrawLevelStats (sfnt);
				DrawMainBar (TicFrac);
			}
			else // Hide HUD on Automap
				SetSize(0, 320, 200);
		}
		else if (state == HUD_Fullscreen)
		{
			BeginHUD();
			DrawLevelStats (sfnt);
			DrawFullScreenStuff();
		}
	}

	protected void DrawFullScreenStuff ()
	{
		if(splitHUD.getint())
			DrawSplit();
		else
			DrawUnsplit();
	}
	
	// =================================
	// Draw Berserk Symbol if CVAR is on
	// =================================
	void drawBerserk(float alphaFloat, bool split = 0)
	{
		if(berserkShow.GetInt() && CPlayer.mo.FindInventory("PowerStrength"))
		{
			DrawImage("BERSERK", (split ? 138-isHacX(1)-isFreeDoom(3) : 14-isHacX(2)-isFreeDoom(3), -1), split ? DI_SCREEN_LEFT_BOTTOM : DI_SCREEN_CENTER_BOTTOM, alphaFloat);
		}
	}
}