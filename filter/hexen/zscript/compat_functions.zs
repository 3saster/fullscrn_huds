extend Class SpecialHexenStatusBar
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