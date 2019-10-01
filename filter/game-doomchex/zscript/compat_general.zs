extend Class SpecialDoomStatusBar
{
	void setSTBARNames()
	{
		switch(STBAR_HASH)
		{
		case 0x0b3cb286: // Alien Vendetta
			//console.printf("This is Alien Vendetta.");
			HUD_SMP   = "HUD_SMP";
			HUD_DM    = "HUD_DM";
			HUD_LEFT  = "HUD_LEFT_AVACT";
			HUD_RIGHT = "HUD_RIGHT_AVACT";
			break;
		case 0xabeed637: // Avactor
			//console.printf("This is Avactor.");
			HUD_SMP   = "HUD_SMP";
			HUD_DM    = "HUD_DM";
			HUD_LEFT  = "HUD_LEFT_AVACT";
			HUD_RIGHT = "HUD_RIGHT_AVACT";
			break;
		default:
			HUD_SMP   = "HUD_SMP";
			HUD_DM    = "HUD_DM";
			HUD_LEFT  = "HUD_LEFT";
			HUD_RIGHT = "HUD_RIGHT";
			break;
		}
	}

    // MurmurHash2, by Austin Appleby, modified by 3saster
    // I'd use something like MD5, but that's much harder to implement...
    int Hash ( string key, uint seed = 0x1de319fa )
    {
        int len = key.length();
        
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