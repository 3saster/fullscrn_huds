Class Statusbar_Overrider : StaticEventHandler
{
	transient CVAR override_bar;
	bool loaded;
	ui BaseStatusBar originalStatusBar;
	ui BaseStatusBar overrideStatusBar;
	
	String StatusBarName;
	
	override void OnRegister()
	{
		override_bar = CVar.FindCVar("fullhud_override"); 
		loaded = false;
		
		switch(gameinfo.gametype)
		{
		case GAME_DOOM:
		case GAME_CHEX:
		default:
			StatusBarName = "SpecialDoomStatusBar";
			break;
		case GAME_HERETIC:
			StatusBarName = "SpecialHereticStatusBar";
			break;
		case GAME_HEXEN:
			StatusBarName = "SpecialHexenStatusBar";
			break;
		case GAME_STRIFE:
			StatusBarName = "SpecialStrifeStatusBar";
			break;
		}
	}
	
	// Status bar can only be successfully overridden after the world has been loaded
	override void WorldLoaded(WorldEvent e)
	{
		loaded = true;
	}
	override void WorldUnloaded(WorldEvent e)
	{
		loaded = false;
	}
	
	override void UiTick()
	{
		if(loaded && gameinfo.gametype != GAME_STRIFE) //Ignore Strife until it is implemented
		{
			// Obtain original statusbar
			if(!originalStatusBar) originalStatusBar = Statusbar;
			// If original is Fullscreen HUD, no need to do anything
			if(originalStatusBar.GetClassName() == StatusBarName) return;
			// Create Fullscreen HUD to override with
			if(override_bar.GetInt() && !overrideStatusBar)
			{
				overrideStatusBar = BaseStatusBar(new(StatusBarName));
				overrideStatusBar.Init();
				overrideStatusBar.AttachToPlayer(players[consoleplayer]);
			}
			
			// Override Status Bar (don't delete original, causes problems with SBARINFO)
			if(override_bar.GetInt() && Statusbar.GetClassName() != StatusBarName)
			{
				Statusbar = overrideStatusBar;
			}
			// Restore original, destroy created status bar
			else if(!override_bar.GetInt() && Statusbar != originalStatusBar)
			{
				Statusbar = originalStatusBar;
				if(overrideStatusBar) overrideStatusBar.Destroy();
			}
		}
	}
}
