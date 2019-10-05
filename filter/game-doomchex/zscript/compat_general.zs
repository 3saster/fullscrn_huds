extend Class SpecialDoomStatusBar
{
	void setSTBARNames()
	{
		// Defaults
		HUD_SMP   = "HUD_SMP";
		HUD_DM    = "HUD_DM";
		HUD_LEFT  = "HUD_LEFT";
		HUD_RIGHT = "HUD_RIGHT";
		STYSNUM   = "STYSNUM";
		STGNUM    = "STGNUM";
		ARMS_OFFSET = 0;

		Font fnt;
		// Deal with compatibility with certain PWADS
		switch(STBAR_HASH)
		{
		case 0x0B3CB286: // Alien Vendetta
			HUD_LEFT  = "HUD_LEFT_AV";
			HUD_RIGHT = "HUD_RIGHT_AV";
			break;

		case 0xABEED637: // Avactor
			HUD_LEFT  = "HUD_LEFT_AVACT";
			HUD_RIGHT = "HUD_RIGHT_AVACT";
			break;

		case 0x2DB89823: // Eviternity
		case 0x4F9D3A57: // Epic 2
			HUD_LEFT  = "HUD_LEFT_EVET";
			HUD_RIGHT = "HUD_RIGHT_EVET";
			break;

		case 0xB43917B8: // Memento Mori 2
			HUD_LEFT  = "HUD_LEFT_MM2";
			HUD_RIGHT = "HUD_RIGHT_MM2";
			STYSNUM   = "MM2_NUM";
			fnt = "INDEXFONT_MM2";
			mIndexFontF = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft);
			fnt = "HUDFONT_MM2";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
			break;

		case 0x0D8A3598: // Back to Saturn X Episode 1
		                 // Doom 4 Vanilla
			HUD_LEFT  = "HUD_LEFT_BTSX";
			HUD_RIGHT = "HUD_RIGHT_BTSX";
			STYSNUM   = "BTSX1_N";
			STGNUM    = "BTSX1_";
			fnt = "INDEXFONT_BTSX1";
			mIndexFontF = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft);
			fnt = "HUDFONT_BTSX";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
			break;

		case 0x67E84763: // Back to Saturn X Episode 2
			HUD_LEFT  = "HUD_LEFT_BTSX";
			HUD_RIGHT = "HUD_RIGHT_BTSX";
			STYSNUM   = "BTSX2_N";
			STGNUM    = "BTSX1_";
			fnt = "INDEXFONT_BTSX2";
			mIndexFontF = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft);
			fnt = "HUDFONT_BTSX";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
			break;

		case 0xDF842DC3: // Neural Upscale 2X Pack
			HUD_SMP   = "HUD_SMP_NEURAL";
			HUD_DM    = "HUD_DM_NEURAL";
			HUD_LEFT  = "HUD_LEFT_NEURAL";
			HUD_RIGHT = "HUD_RIGHT_NEURAL";
			break;

		case 0xF1837667: // Eternal Doom
			HUD_LEFT  = "HUD_LEFT_ETERNAL";
			HUD_RIGHT = "HUD_RIGHT_ETERNAL";
			STYSNUM = "ETE_NUM";
			ARMS_OFFSET = -2.5;
			fnt = "HUDFONT_ETERNAL";
			mHUDFont = HUDFont.Create(fnt, fnt.GetCharWidth("0"), Mono_CellLeft, 1, 1);
			break;

		case 0xC901D1A0: // Tangerine Nightmare
			HUD_LEFT  = "HUD_LEFT_TN";
			HUD_RIGHT = "HUD_RIGHT_TN";
			STGNUM = "STG_TN";
			break;

		case 0xC0A46A33: // Dystopia 3
			HUD_LEFT = "HUD_LEFT_DYSTOPIA";
			break;
		}

		if( isChex() )
		{
			STYSNUM   = "CTYSNUM";
			STGNUM    = "CTGNUM";
		}
	}

    // MurmurHash2, by Austin Appleby, modified by 3saster
    // I'd use something like MD5, but that's much harder to implement...
    int Hash (string key)
    {
        int len = key.length();
        uint seed = 0x1de319fa;
        
        // 'm' and 'r' are mixing constants generated offline.
        // They're not really 'magic', they just happen to work well.

        uint m = 0x5bd1e995;
        int r = 24;

        // Initialize the hash to a 'random' value

        uint h = seed ^ len;

        for(int i = 0; i < len; i++)
        {
            uint k = key.ByteAt(i);
            
            k *= m; 
            k ^= k >> r; 
            k *= m; 
            
            h *= m; 
            h ^= k;
        }

        // Do a few final mixes of the hash to ensure the last few
        // bytes are well-incorporated.

        h ^= h >> 13;
        h *= m;
        h ^= h >> 15;

        return h;
    } 
}