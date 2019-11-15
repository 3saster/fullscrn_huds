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
	HUDFont mSmallFont;
	HUDFont mIndexFontF;
	
	// A hash to identify which STBAR is loaded
	uint STBAR_HASH;

	// Strings describing the components of the STBAR
	string HUD_LEFT;
	string HUD_RIGHT;
	string HUD_SMP;
	string HUD_DM;

	// Strings describing certain font-related things
	string STYSNUM;
	string STGNUM;

	// Offset for Split Arms
	double ARMS_OFFSET;

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
		
		mSmallFont = HUDFont.Create(SmallFont, SmallFont.GetCharWidth("0"), Mono_CellCenter, 1, 1);
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
		setAmmoNames();

		// Find last loaded STBAR Lump
		int lastLump = Wads.FindLump("STBAR",0,1);
		int nextLump =  Wads.FindLump("STBAR",lastLump+1,1);
		while( nextLump != -1 )
		{
			lastLump = nextLump;
			nextLump = Wads.FindLump("STBAR",lastLump+1,1);
		}
		// Hash the value of the STBAR lump
		STBAR_HASH = Hash(Wads.ReadLump(lastLump));

		// Uncomment this to print the STBAR Hash in the console
		//console.printf("\nSTBAR Hash is: 0x%08X",STBAR_HASH);

		setSTBARNames();
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

	// ================================
	// Concatenate two strings together
	// ================================
	string concat(string s1, string s2)
	{
		return string.format("%s%s",s1,s2);
	}
}