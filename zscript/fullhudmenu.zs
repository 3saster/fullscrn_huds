// Copyright 2017-2019 Nash Muhandes
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
// 3. The name of the author may not be used to endorse or promote products
//    derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
// IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
// IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
// NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
// THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//===========================================================================
//
// Custom Widgets for SpriteShadow 
// 3saster: names modified, ScaleSlider added, added option to Option class
//          to not display if HacX is the IWAD.
// Adds tooltips to widgets
//
// Some redundant duplicates here but whatever; menus are painful to work
// with in general anyway. >:(
//
//===========================================================================

class OptionMenuItemFullHUDOption : OptionMenuItemOption
{
	String mTooltip;
	bool HacXShow; // Show this option if HacX is active
	bool isHacX()
	{
		return (Wads.CheckNumForName("HACX-R",0)!=-1 || Wads.CheckNumForName("HACX-E",0)!=-1);
	}

	OptionMenuItemFullHUDOption Init(String label, String tooltip, Name command, Name values, CVar graycheck = null, int center = 0, bool allowHacX = true)
	{
		HacXShow = allowHacX || !isHacX();
		if(HacXShow)
		{
			mTooltip = tooltip;
			Super.Init(label, command, values, graycheck, center);
		}
		return self;
	}
}

class OptionMenuItemFullHUDSlider : OptionMenuItemSlider
{
	String mTooltip;

	OptionMenuItemFullHUDSlider Init(String label, String tooltip, Name command, double min, double max, double step, int showval = 1)
	{
		mTooltip = tooltip;
		Super.Init(label, command, min, max, step, showval);
		return self;
	}
}

class OptionMenuItemFullHUDScaleSlider : OptionMenuItemScaleSlider
{
	String mTooltip;

	OptionMenuItemFullHUDScaleSlider Init(String label, String tooltip, Name command, double min, double max, double step, String zero, String negone = "")
	{
		mTooltip = tooltip;
		Super.Init(label, command, min, max, step, zero, negone);
		return self;
	}
}

class OptionMenuItemFullHUDControl : OptionMenuItemControl
{
	String mTooltip;

	OptionMenuItemFullHUDControl Init(String label, String tooltip, Name command)
	{
		mTooltip = tooltip;
		Super.Init(label, command);
		return self;
	}
}

//===========================================================================
//
// SpriteShadow Menu
//
//===========================================================================

class FullHUDMenu : OptionMenu
{
	override void Drawer ()
	{
		// Delete entry in HacX if this option should not be on
		for(int i = 0; i < mDesc.mItems.Size(); i++)
			if( mDesc.mItems[i] is "OptionMenuItemFullHUDOption" )
				if( !OptionMenuItemFullHUDOption(mDesc.mItems[i]).HacXShow )
					mDesc.mItems.Delete(i);

		Super.Drawer();

		String tt;

		if (mDesc.mSelectedItem > 0)
		{
			if (mDesc.mItems[mDesc.mSelectedItem] is "OptionMenuItemFullHUDOption")
			{
				tt = StringTable.Localize(OptionMenuItemFullHUDOption(mDesc.mItems[mDesc.mSelectedItem]).mTooltip);
			}

			if (mDesc.mItems[mDesc.mSelectedItem] is "OptionMenuItemFullHUDSlider")
			{
				tt = StringTable.Localize(OptionMenuItemFullHUDSlider(mDesc.mItems[mDesc.mSelectedItem]).mTooltip);
			}
			
			if (mDesc.mItems[mDesc.mSelectedItem] is "OptionMenuItemFullHUDScaleSlider")
			{
				tt = StringTable.Localize(OptionMenuItemFullHUDScaleSlider(mDesc.mItems[mDesc.mSelectedItem]).mTooltip);
			}

			if (mDesc.mItems[mDesc.mSelectedItem] is "OptionMenuItemFullHUDControl")
			{
				tt = StringTable.Localize(OptionMenuItemFullHUDControl(mDesc.mItems[mDesc.mSelectedItem]).mTooltip);
			}
		}

		if (tt.Length() > 0)
		{
			Screen.DrawText (OptionFont(), OptionMenuSettings.mFontColorValue,
				(Screen.GetWidth() - OptionFont().StringWidth (tt) * CleanXfac_1) / 2,
				BigFont.GetHeight() * CleanYfac_1 * 2.5,
				tt,
				DTA_CleanNoMove_1, true);
		}
	}
}
