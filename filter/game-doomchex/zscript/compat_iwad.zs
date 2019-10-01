extend Class SpecialDoomStatusBar
{	
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
	
	// =======================
	// Add arms for Chex Quest
	// =======================
	string addArms(string input)
	{
		string output = string.format("%s%s", input, chexArms && chexArms.GetInt() ? "_ARMS" : "");
		return output;
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
	
	Array<String> ammoNames;
	// ===========================================
	// Override to ensure standard HUD still works
	// ===========================================
	override void DrawBarAmmo()
	{
		int amt1, maxamt;
		
		for(int i = 0; i < ammoNames.size(); i++)
		{
			[amt1, maxamt] = GetAmount(ammoNames[i]);
			DrawString(mIndexFont, FormatNumber(amt1, 3), (288, 173+6*i), DI_TEXT_ALIGN_RIGHT);
			DrawString(mIndexFont, FormatNumber(maxamt, 3), (314, 173+6*i), DI_TEXT_ALIGN_RIGHT);
		}
	}
	
	// ===================================
	// Get Ammo Names for particular games
	// ===================================
	void setAmmoNames()
	{
		string ammoString;
		if( isHacX() )
			ammoString = "HacxRounds, HacxCartridges, HacxTorpedo, HacxMolecules";
		else if ( isHarmony() )
			ammoString = "MinigunAmmo, Shells, TimeBombAmmo, ChaosBarsAmmo";
		else
			ammoString = "Clip, Shell, RocketAmmo, Cell";
		ammoString.Split(ammoNames, ", ");
	}
}