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
	
	// If Chex, change arms to match chexfont (this allows the normal HUD to work)
	string chexName(string input)
	{
		if(isChex())
		{
			input.replace("STY","CTY");
			input.replace("STG","CTG");
		}
		return input;
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
	
	// ================================================
	// Override to ensure HacX standard HUD still works
	// ================================================
	override void DrawBarAmmo()
	{
		if ( !isHacX() )
			Super.DrawBarAmmo();
		else
		{
			int amt1, maxamt;
			// We must store the ammo types in a string, because using them directly 
			// will prevent GZDoom from starting because it tries to resolve the names
			// at launch instead of during runtime
			string ammoClass; 
			
			ammoClass = "HacxRounds";
			[amt1, maxamt] = GetAmount(ammoClass);
			DrawString(mIndexFont, FormatNumber(amt1, 3), (288, 173), DI_TEXT_ALIGN_RIGHT);
			DrawString(mIndexFont, FormatNumber(maxamt, 3), (314, 173), DI_TEXT_ALIGN_RIGHT);
			
			ammoClass = "HacxCartridges";
			[amt1, maxamt] = GetAmount(ammoClass);
			DrawString(mIndexFont, FormatNumber(amt1, 3), (288, 179), DI_TEXT_ALIGN_RIGHT);
			DrawString(mIndexFont, FormatNumber(maxamt, 3), (314, 179), DI_TEXT_ALIGN_RIGHT);
			
			ammoClass = "HacxTorpedo";
			[amt1, maxamt] = GetAmount(ammoClass);
			DrawString(mIndexFont, FormatNumber(amt1, 3), (288, 185), DI_TEXT_ALIGN_RIGHT);
			DrawString(mIndexFont, FormatNumber(maxamt, 3), (314, 185), DI_TEXT_ALIGN_RIGHT);
			
			ammoClass = "HacxMolecules";
			[amt1, maxamt] = GetAmount(ammoClass);
			DrawString(mIndexFont, FormatNumber(amt1, 3), (288, 191), DI_TEXT_ALIGN_RIGHT);
			DrawString(mIndexFont, FormatNumber(maxamt, 3), (314, 191), DI_TEXT_ALIGN_RIGHT);
		}
	}
}