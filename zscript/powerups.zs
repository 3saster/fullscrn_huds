mixin Class PowerupValues
{
	Array<String> PowerupNames;   // Actual Name of the powerup
	Array<String> PowerupDisplay; // Name to display on stats
	// =============================
	// Get Powerup Names and Strings
	// =============================
	// Special thanks to Tekish's Levelinfo, since this saved me a lot of time
	void setPowerupNames()
	{
		let pclass = CPlayer.mo.GetClassName();
		string s; // Use this to avoid error on startup
		// Argent
		if (pclass == "ArgPlayer")
		{
			// PowerupNames.Push("PowerStrength");      PowerupDisplay.Push("$FULLHUD_POWERUP_BERSERK");
			PowerupNames.Push("ArgPowerHasteSpeed");  PowerupDisplay.Push("$FULLHUD_POWERUP_SPEED");
			PowerupNames.Push("PowerInvisibility");   PowerupDisplay.Push("$FULLHUD_POWERUP_INVIS");
			PowerupNames.Push("ArgPowerInvuln");      PowerupDisplay.Push("$FULLHUD_POWERUP_INVUL");
			PowerupNames.Push("PowerLightamp");       PowerupDisplay.Push("$FULLHUD_POWERUP_LIGHT");
			PowerupNames.Push("ArgPowerQuadDamage");  PowerupDisplay.Push("$FULLHUD_POWERUP_QUAD");
			PowerupNames.Push("ArgPowerRegen");       PowerupDisplay.Push("$FULLHUD_POWERUP_REGEN");
			PowerupNames.Push("PowerIronfeet");       PowerupDisplay.Push("$FULLHUD_POWERUP_SUIT");
			return;
		}

		// Ashes 2063
		if (pclass == "Scavenger")
		{
			PowerupNames.Push("PowerInvulnerable");       PowerupDisplay.Push("$FULLHUD_POWERUP_INVUL");
			PowerupNames.Push("PowerDoubleFiringSpeed");  PowerupDisplay.Push("$FULLHUD_POWERUP_RAGE");
			PowerupNames.Push("PowerRegeneration");       PowerupDisplay.Push("$FULLHUD_POWERUP_REGEN");
			PowerupNames.Push("PowerIronfeet");           PowerupDisplay.Push("$FULLHUD_POWERUP_SUIT");
			return;
		}

		// Brutal Doom
		s = "IsNOTTacticalClass";
		if (pclass == "BDoomer" || pclass == "Doomer2" || pclass == "TacticalDoomer" || (pclass == "Purist" && CPlayer.mo.findinventory(s)))
		{
			// PowerupNames.Push("PowerStrength");          PowerupDisplay.Push("$FULLHUD_POWERUP_BERSERK");
			PowerupNames.Push("PowerInvisibility");       PowerupDisplay.Push("$FULLHUD_POWERUP_INVIS");
			PowerupNames.Push("PowerInvulnerable");       PowerupDisplay.Push("$FULLHUD_POWERUP_INVUL");
			PowerupNames.Push("PowerTorch");              PowerupDisplay.Push("$FULLHUD_POWERUP_LIGHT");
			PowerupNames.Push("PowerIronfeet");           PowerupDisplay.Push("$FULLHUD_POWERUP_SUIT");
			return;
		}

		// Death Foretold
		if (pclass == "Doom4Player")
		{
			PowerupNames.Push("PowerD4Strength");      PowerupDisplay.Push("$FULLHUD_POWERUP_BERSERK");
			PowerupNames.Push("PowerD4Speed");         PowerupDisplay.Push("$FULLHUD_POWERUP_SPEED");
			PowerupNames.Push("PowerD4Invisibility");  PowerupDisplay.Push("$FULLHUD_POWERUP_INVIS");
			PowerupNames.Push("PowerD4Invulnerable");  PowerupDisplay.Push("$FULLHUD_POWERUP_INVUL");
			PowerupNames.Push("PowerLightamp");        PowerupDisplay.Push("$FULLHUD_POWERUP_LIGHT");
			PowerupNames.Push("PowerQDamage");         PowerupDisplay.Push("$FULLHUD_POWERUP_QUAD");
			PowerupNames.Push("PowerD4Regeneration");  PowerupDisplay.Push("$FULLHUD_POWERUP_REGEN");
			PowerupNames.Push("PowerD4IronFeet");      PowerupDisplay.Push("$FULLHUD_POWERUP_SUIT");
			return;
		}

		// Doom 64 Retribution
		s = "Stamina";
		if (pclass == "64DoomPlayer" && !CPlayer.mo.findinventory(s))
		{
			// PowerupNames.Push("PowerStrength");     PowerupDisplay.Push("$FULLHUD_POWERUP_BERSERK");
			PowerupNames.Push("PowerInvisibility");  PowerupDisplay.Push("$FULLHUD_POWERUP_INVIS");
			PowerupNames.Push("PowerInvulnerable");  PowerupDisplay.Push("$FULLHUD_POWERUP_INVUL");
			PowerupNames.Push("64PowerLightAmp");    PowerupDisplay.Push("$FULLHUD_POWERUP_LIGHT");
			PowerupNames.Push("PowerIronfeet");      PowerupDisplay.Push("$FULLHUD_POWERUP_SUIT");
			return;
		}

		// Doom Incarnate
		if (pclass == "CaptainBlazkowicz")
		{
			PowerupNames.Push("PowerWrath");           PowerupDisplay.Push("$FULLHUD_POWERUP_BERSERK");
			PowerupNames.Push("PowerPsyche");          PowerupDisplay.Push("$FULLHUD_POWERUP_INVIS");
			PowerupNames.Push("PowerBattleSuit");      PowerupDisplay.Push("$FULLHUD_POWERUP_INVUL");
			PowerupNames.Push("PowerLightamp");        PowerupDisplay.Push("$FULLHUD_POWERUP_LIGHT");
			PowerupNames.Push("PowerQuadDamage");      PowerupDisplay.Push("$FULLHUD_POWERUP_QUAD");
			PowerupNames.Push("PowerQ3Regeneration");  PowerupDisplay.Push("$FULLHUD_POWERUP_REGEN");
			PowerupNames.Push("PowerIronfeet");        PowerupDisplay.Push("$FULLHUD_POWERUP_SUIT");
			return;
		}

		// Flakes Doom
		s = "FirstTimeShotgunning";
		if (pclass == "FKPlayer" && CPlayer.mo.findinventory(s))
		{
			PowerupNames.Push("PowerHaste");         PowerupDisplay.Push("$FULLHUD_POWERUP_SPEED");
			PowerupNames.Push("PowerInvisibility");  PowerupDisplay.Push("$FULLHUD_POWERUP_INVIS");
			PowerupNames.Push("PowerInvulnerable");  PowerupDisplay.Push("$FULLHUD_POWERUP_INVUL");
			PowerupNames.Push("PowerLightAmp");      PowerupDisplay.Push("$FULLHUD_POWERUP_LIGHT");
			PowerupNames.Push("PowerQuadDamage");    PowerupDisplay.Push("$FULLHUD_POWERUP_QUAD");
			PowerupNames.Push("PowerIronfeet");      PowerupDisplay.Push("$FULLHUD_POWERUP_SUIT");
			return;
		}

		// Project Brutality
		s = "IsNOTTacticalClass";
		if (pclass == "BrutalDoomer" || pclass == "Traditional" || (pclass == "Purist" && !CPlayer.mo.findinventory(s)))
		{
			// PowerupNames.Push("PowerStrength");          PowerupDisplay.Push("$FULLHUD_POWERUP_BERSERK");
			PowerupNames.Push("PowerDoubleDamage");       PowerupDisplay.Push("$FULLHUD_POWERUP_DAMAGE");
			PowerupNames.Push("PowerSpeed");              PowerupDisplay.Push("$FULLHUD_POWERUP_SPEED");
			PowerupNames.Push("PowerInvisibility");       PowerupDisplay.Push("$FULLHUD_POWERUP_INVIS");
			PowerupNames.Push("PowerInvulnerable");       PowerupDisplay.Push("$FULLHUD_POWERUP_INVUL");
			PowerupNames.Push("PowerLightAmp");           PowerupDisplay.Push("$FULLHUD_POWERUP_LIGHT");
			PowerupNames.Push("PowerDoubleFiringSpeed");  PowerupDisplay.Push("$FULLHUD_POWERUP_RAGE");
			PowerupNames.Push("PowerTimeFreezer");        PowerupDisplay.Push("$FULLHUD_POWERUP_TIME");
			PowerupNames.Push("PowerIronfeet");           PowerupDisplay.Push("$FULLHUD_POWERUP_SUIT");
			return;
		}

		// Doom
		// PowerupNames.Push("PowerStrength");     PowerupDisplay.Push("$FULLHUD_POWERUP_BERSERK");  // Berserk (Doom)
		PowerupNames.Push("PowerInvisibility");  PowerupDisplay.Push("$FULLHUD_POWERUP_INVIS");    // BlurSphere (Doom)
		PowerupNames.Push("PowerLightamp");      PowerupDisplay.Push("$FULLHUD_POWERUP_LIGHT");    // Infrared (Doom)
		PowerupNames.Push("PowerIronfeet");      PowerupDisplay.Push("$FULLHUD_POWERUP_SUIT");     // Radsuit (Doom)
		// Heretic
		PowerupNames.Push("PowerGhost");         PowerupDisplay.Push("$FULLHUD_POWERUP_GHOST");    // ArtiInvisibility (Heretic)
		PowerupNames.Push("PowerWeaponlevel2");  PowerupDisplay.Push("$FULLHUD_POWERUP_TOMED");    // ArtiTomeOfPower (Heretic)
		// Hexen
		PowerupNames.Push("PowerMinotaur");      PowerupDisplay.Push("$FULLHUD_POWERUP_ALLY");     // ArtiDarkServant (Hexen)
		PowerupNames.Push("PowerSpeed");         PowerupDisplay.Push("$FULLHUD_POWERUP_SPEED");    // ArtiSpeedBoots (Hexen)
		// Strife
		PowerupNames.Push("PowerShadow");        PowerupDisplay.Push("$FULLHUD_POWERUP_SHADOW");   // ShadowArmor (Strife)
		PowerupNames.Push("PowerMask");          PowerupDisplay.Push("$FULLHUD_POWERUP_SUIT");     // EnvironmentalSuit (Strife)
		PowerupNames.Push("PowerTargeter");      PowerupDisplay.Push("$FULLHUD_POWERUP_TARGETER"); // Targeter (Strife)
		PowerupNames.Push("PowerScanner");       PowerupDisplay.Push("$FULLHUD_POWERUP_SCANNER");  // Scanner (Strife)
		// Shared
		PowerupNames.Push("PowerInvulnerable");  PowerupDisplay.Push("$FULLHUD_POWERUP_INVUL"); // InvulnerabilitySphere (Doom), ArtiInvulnerability/ArtiInvulnerability2 (Heretic/Hexen)
		if(!level.infinite_flight)
		{
			PowerupNames.Push("PowerFlight");    PowerupDisplay.Push("$FULLHUD_POWERUP_FLY"); // ArtiFly (Heretic/Hexen)
		}
		PowerupNames.Push("PowerTorch");         PowerupDisplay.Push("$FULLHUD_POWERUP_TORCH"); // ArtiTorch (Heretic/Hexen)
		return;
	}

	int,String GetMorphTics()
	{
		let pclass = CPlayer.mo.GetClassName();
		int morphtics = players[consoleplayer].morphtics;
		if(morphtics > 0x0fffffff) // This is probably from a powermorph...
		{
			morphtics = 0;
			let inv = Powerup(CPlayer.mo.FindInventory("PowerMorph",true));
			if( inv && inv.EffectTics > 0)
			{
				morphtics = inv.EffectTics;
			}
		}

		String classname;
		if(morphtics > 0)
		{
			// Pig (Hexen)
			if     (pclass == "PigPlayer")
				classname = "$FULLHUD_POWERUP_MORPHPIG";
			// Chicken (Heretic)
			else if(pclass == "ChickenPlayer") 
				classname = "$FULLHUD_POWERUP_MORPHCHICKEN";
			// Revenant (Brutal Doom/Project Brutality)
			else if(pclass == "RevenantPlayer")
				classname = "$FULLHUD_POWERUP_MORPHREVENANT";
			// Baron (Brutal Doom/Project Brutality)
			else if(pclass == "BaronPlayer")
				classname = "$FULLHUD_POWERUP_MORPHBARON";
			// Unknown Morph
			else
				classname = "Morph";
		}

		return morphtics, classname;
	}
}