mixin Class CompatFunctions
{
	// =================================
	// Wrapper to add offsets for LZDoom
	// =================================
	float isLZDoom(float offset = 1.0)
	{
		if(borderless)
			return offset;
		return 0;
	}

	// ===================================
	// Wrapper to add offsets for Freedoom
	// ===================================
	float isFreeDoom(float offset = 1.0)
	{
		if(Wads.CheckNumForName("FREEDOOM",0)!=-1)
			return offset;
		return 0;
	}
	
	// =====================================
	// Wrapper to add offsets for Chex Quest
	// =====================================
	float isChex(float offset = 1.0)
	{
		return gameinfo.gametype & GAME_Chex ? offset : 0;
	}
	
	// ===============================
	// Wrapper to add offsets for HacX
	// ===============================
	float isHacX(float offset = 1.0)
	{
		if(Wads.CheckNumForName("HACX-R",0)!=-1 || Wads.CheckNumForName("HACX-E",0)!=-1)
			return offset;
		return 0;
	}
	
	// ==================================
	// Wrapper to add offsets for Harmony
	// ==================================
	float isHarmony(float offset = 1.0)
	{
		if(Wads.CheckNumForName("MAP01",0)!=-1 && Wads.CheckNumForName("0HAWK01",0)!=-1 && Wads.CheckNumForName("0CARA3",0)!=-1 && Wads.CheckNumForName("0NOSE1",0)!=-1)
			return offset;
		return 0;
	}
	
	// ======================================
	// Wrapper to add offsets for Pirate Doom
	// ======================================
	float isPirateDoom(float offset = 1.0)
	{
		if(Wads.CheckNumForName("0097",0)!=-1 && Wads.CheckNumForName("INTROPIA",0)!=-1 && Wads.CheckNumForName("BARNAC",0)!=-1 && Wads.CheckNumForName("MAP59",0)!=-1)
			return offset;
		return 0;
	}

	// ======================================
	// Wrapper to add offsets for Brutal Doom
	// ======================================
	float isBrutalDoom(float offset = 1.0)
	{
		if(Wads.CheckNumForName("ANIMFSA",0)!=-1 && Wads.CheckNumForName("BOTINFO",0)!=-1 && Wads.CheckNumForName("CMPGNINF",0)!=-1 && Wads.CheckNumForName("DYNAMICLEV",0)!=-1)
			return offset;
		return 0;
	}
}