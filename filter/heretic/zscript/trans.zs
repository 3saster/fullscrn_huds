extend Class SpecialHereticStatusBar
{
	// ======================================
	// Same as DrawGem, but with transparency
	// ======================================
	void DrawGemTrans(String chain, String gem, int displayvalue, int maxrange, Vector2 pos, int leftpadding, int rightpadding, int chainmod, int flags = 0, float trans = 1.)
	{
		TextureID chaintex = TexMan.CheckForTexture(chain, TexMan.TYPE_MiscPatch);
		if (!chaintex.IsValid()) return;
		Vector2 chainsize = TexMan.GetScaledSize(chaintex);
		[pos, flags] = AdjustPosition(pos, flags, chainsize.X, chainsize.Y);

		displayvalue = clamp(displayvalue, 0, maxrange);
		int offset = int(double(chainsize.X - leftpadding - rightpadding) * displayvalue / maxrange);
	
		DrawTexture(chaintex, pos + (offset % chainmod, 0), flags | DI_ITEM_LEFT_TOP,trans);
		DrawImage(gem, pos + (offset + leftPadding, 0), flags | DI_ITEM_LEFT_TOP,trans);
	}
	
	// =========================================================
	// Same as DrawInventoryBar, but with transparency for items
	// =========================================================
	void DrawInventoryBarTrans(InventoryBarState parms, Vector2 position, int numfields, int flags = 0, double bgalpha = 1., double fgalpha = 1., double numalpha = 1.)
	{
		double width = parms.boxsize.X * numfields;
		[position, flags] = AdjustPosition(position, flags, width, parms.boxsize.Y);
		
		CPlayer.mo.InvFirst = ValidateInvFirst(numfields);
		if (CPlayer.mo.InvFirst == null) return;	// Player has no listed inventory items.
		
		Vector2 boxsize = parms.boxsize;
		// First draw all the boxes
		for(int i = 0; i < numfields; i++)
		{
			DrawTexture(parms.box, position + (boxsize.X * i, 0), flags | DI_ITEM_LEFT_TOP, bgalpha);
		}
		
		// now the items and the rest
		
		Vector2 itempos = position + boxsize / 2;
		Vector2 textpos = position + boxsize - (1, 1 + parms.amountfont.mFont.GetHeight());

		int i = 0;
		Inventory item;
		for(item = CPlayer.mo.InvFirst; item != NULL && i < numfields; item = item.NextInv())
		{
			for(int j = 0; j < 2; j++)
			{
				if (j ^ !!(flags & DI_DRAWCURSORFIRST))
				{
					if (item == CPlayer.mo.InvSel)
					{
						double flashAlpha = fgalpha;
						if (flags & DI_ARTIFLASH) flashAlpha *= itemflashFade;
						DrawTexture(parms.selector, position + parms.selectofs + (boxsize.X * i, 0), flags | DI_ITEM_LEFT_TOP, flashAlpha);
					}
				}
				else
				{
					DrawInventoryIcon(item, itempos + (boxsize.X * i, 0), flags | DI_ITEM_CENTER, fgalpha );
				}
			}
			
			if (parms.amountfont != null && (item.Amount > 1 || (flags & DI_ALWAYSSHOWCOUNTERS)))
			{
				DrawString(parms.amountfont, FormatNumber(item.Amount, 0, 5), textpos + (boxsize.X * i, 0), flags | DI_TEXT_ALIGN_RIGHT, parms.cr, numalpha);
			}
			i++;
		}
		// Is there something to the left?
		if (CPlayer.mo.FirstInv() != CPlayer.mo.InvFirst)
		{
			DrawTexture(parms.left, position + (-parms.arrowoffset.X, parms.arrowoffset.Y), flags | DI_ITEM_RIGHT|DI_ITEM_VCENTER, fgalpha);
		}
		// Is there something to the right?
		if (item != NULL)
		{
			DrawTexture(parms.right, position + parms.arrowoffset + (width, 0), flags | DI_ITEM_LEFT|DI_ITEM_VCENTER, fgalpha);
		}
	}
}