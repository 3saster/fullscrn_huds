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
		if( Wads.CheckNumForName("MAP01",0)!=-1 && Wads.CheckNumForName("0HAWK01",0)!=-1 && Wads.CheckNumForName("0CARA3",0)!=-1 && Wads.CheckNumForName("0NOSE1",0)!=-1)
			return offset;
		return 0;
	}
	
	// ======================================
	// Wrapper to add offsets for Pirate Doom
	// ======================================
	float isPirateDoom(float offset = 1.0)
	{
		if( Wads.CheckNumForName("0097",0)!=-1 && Wads.CheckNumForName("INTROPIA",0)!=-1 && Wads.CheckNumForName("BARNAC",0)!=-1 && Wads.CheckNumForName("MAP59",0)!=-1)
			return offset;
		return 0;
	}
	
	// ===================================================
	// Wrapper to add offsets for Freame 2 (idgames 15613)
	// ===================================================
	float isFreame2(float offset = 1.0)
	{
		string classname = "GhostClaw";
		class<Actor> cls = classname;
		if( cls && Wads.CheckNumForName("RKEYICON",0)!=-1 && Wads.CheckNumForName("G_START",0)!=-1 && Wads.CheckNumForName("G_END",0) )
			return offset;
		return 0;
	}

	// ===============================================
	// Wrapper to add offsets for Extreme Weapons Pack
	// ===============================================
	float isEWPack(float offset = 1.0)
	{
		string classname = "WTFHSGLOL6283185";
		class<Actor> cls = classname;
		if( cls )
			return offset;
		return 0;
	}

	// =============================================
	// Wrapper to add offsets for Corrupted Techbase
	// =============================================
	string cortech;
	float isCorTech(float offset = 1.0)
	{
		if(cortech.length() != 32)
		{
			int lastLump = Wads.FindLump("TITLEPIC",0,1);
			int nextLump =  Wads.FindLump("TITLEPIC",lastLump+1,1);
			while( nextLump != -1 )
			{
				lastLump = nextLump;
				nextLump = Wads.FindLump("TITLEPIC",lastLump+1,1);
			}
			cortech = MD5.Hash(Wads.ReadLump(lastLump));
		}
		if( cortech == "66e17f86093f83e4d5929d43e6fc6c20" )
			return offset;
		return 0;
	}
}