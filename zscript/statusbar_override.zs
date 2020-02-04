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
			if(!originalStatusBar) originalStatusBar = statusbar;
			if(!overrideStatusBar)
			{
				overrideStatusBar = BaseStatusBar(new(StatusBarName));
				overrideStatusBar.Init();
				overrideStatusBar.AttachToPlayer(players[consoleplayer]);
			}
			
			if(override_bar.GetInt() && Statusbar.GetClassName() != StatusBarName)
			{
				Statusbar = overrideStatusBar;
			}
			else if(!override_bar.GetInt() && Statusbar != originalStatusBar)
			{
				Statusbar = originalStatusBar;
			}
		}
	}
}
