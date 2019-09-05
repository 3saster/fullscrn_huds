extend Class SpecialHexenStatusBar
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
	
	// ===============================================
	// Same as DrawInventoryBar, but with transparency
	// ===============================================
	void DrawBarTrans(String ongfx, String offgfx, double curval, double maxval, Vector2 position, int border, int vertical, int flags = 0, double trans = 1.)
	{
		let ontex = TexMan.CheckForTexture(ongfx, TexMan.TYPE_MiscPatch);
		if (!ontex.IsValid()) return;
		let offtex = TexMan.CheckForTexture(offgfx, TexMan.TYPE_MiscPatch);

		Vector2 texsize = TexMan.GetScaledSize(ontex);
		[position, flags] = AdjustPosition(position, flags, texsize.X, texsize.Y);
		
		double value = (maxval != 0) ? clamp(curval / maxval, 0, 1) : 0;
		if(border != 0) value = 1. - value; // invert since the new drawing method requires drawing the bg on the fg.
		
		
		// {cx, cb, cr, cy}
		double Clip[4];
		Clip[0] = Clip[1] = Clip[2] = Clip[3] = 0;
		
		bool horizontal = !(vertical & SHADER_VERT);
		bool reverse = !!(vertical & SHADER_REVERSE);
		double sizeOfImage = (horizontal ? texsize.X - border*2 : texsize.Y - border*2);
		Clip[(!horizontal) | ((!reverse)<<1)] = sizeOfImage - sizeOfImage *value;
		
		// preserve the active clipping rectangle
		int cx, cy, cw, ch;
		[cx, cy, cw, ch] = screen.GetClipRect();

		if(border != 0)
		{
			for(int i = 0; i < 4; i++) Clip[i] += border;

			// Draw the whole foreground
			DrawTexture(ontex, position, flags | DI_ITEM_LEFT_TOP, trans);
			SetClipRect(position.X + Clip[0], position.Y + Clip[1], texsize.X - Clip[0] - Clip[2], texsize.Y - Clip[1] - Clip[3], flags);
		}
		
		if (offtex.IsValid() && TexMan.GetScaledSize(offtex) == texsize) DrawTexture(offtex, position, flags | DI_ITEM_LEFT_TOP, trans);
		else 
		{
			// Use partial transparency to prevent the foreground from being shown
			int partTrans = trans == 0 ? 0 : 255*(0.4 + 0.6*trans);
			Fill(color(partTrans,0,0,0), position.X + Clip[0], position.Y + Clip[1], texsize.X - Clip[0] - Clip[2], texsize.Y - Clip[1] - Clip[3], flags);
			Fill(color(partTrans,0,0,0), position.X + Clip[0], position.Y + Clip[1], texsize.X - Clip[0] - Clip[2], texsize.Y - Clip[1] - Clip[3], flags);
		}
		
		if (border == 0) 
		{
			SetClipRect(position.X + Clip[0], position.Y + Clip[1], texsize.X - Clip[0] - Clip[2], texsize.Y - Clip[1] - Clip[3], flags);
			DrawTexture(ontex, position, flags | DI_ITEM_LEFT_TOP, trans);
		}
		// restore the previous clipping rectangle
		screen.SetClipRect(cx, cy, cw, ch);
	}
}