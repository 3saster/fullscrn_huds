===========================================================================
Advanced engine needed  : GZDoom 4.3.0+ / LZDoom 3.84+
===========================================================================
Title                : Fullscreen Status Bar Mod (v5.2.0)
Filename             : FULLSCRN_HUDS.PK3
Release date         : xx/xx/2024
Authors              : NightFright / 3saster

Other files by author: Blinking Eyes for Doom Mugshot
		       H!Zone for ZDoom
                       Mapinfo Pack for Doom II PWADs
                       Perk Smooth Weapons Enhanced
                       Widescreen HUDs for Doom/Doom II PWADs

Description          : Fullscreen versions for the status bars of Doom-based
                       games (Doom, Doom II, Final Doom, Freedoom, Chex, HacX,
                       Harmony), Heretic and Hexen with optional transparency
                       and level stats display

Additional Info      : 1) Only works with GZDoom 4.3.0+, LZDoom 3.84+ and other
                          equivalent ports.
                       2) Please make sure to load this file AFTER any mod altering
                          status bars to guarantee maximum compatibility.
                       3) Adds new option menu under "HUD Options" called
                          "Fullscreen Status Bar" (after "Alternative HUD Options").
                          Note: "Full options menu" must be activated!
                       4) Available options:
                             - Standard status bar or split version
                             - Status bar scale (recommended for 1920x1080: 3)
                             - Opaque or transparent rendering
                             - Boom HUD colors for Ammo/Health/Armor
                             - Indicate Berserk mode in Doom/HacX
                             - Chex status bar with ARMS display and ammo overview
                             - Mugshot used for active inventory item on/off
                             - ARMS display for split bar on/off
                             - Show or hide automap status bar
			     - Optionally force traditional automap colors on normal/overlay automap
                             - Switch between Armor Class and armor points (Hexen)
                             - Level stats fully customizable:
                                  + Display in %, countdowns or fraction (+ time)
                                  + 8 positions:
                                      - top left/right
                                      - center left/right
                                      - bottom left/right
                                      - status bar left/right
                                  + Toggle any stat (kills, secrets, items, time)
                                  + Choose between 4 different fonts
                                  + Choose between 22 different stat completion colors
                                  + Optionally show countdowns for active powerups
				  + Optionally abbreviate stats names (K/I/S)
                       5) Adds 15-17 CVARS to your GZDoom ini, starting with "fullhud_"

Known issues         : [CHEX] Logo replacement will only look good if default STBAR graphics
                              are used (with blue background)


Additional Credits to: id Software .................. Original Doom GFX
                       Raven Software ............... Original Heretic/Hexen GFX
                       3saster ...................... ZScript coding
                       AFADoomer .................... MD5 hashing script fix
                       bangstk ...................... Code for widescreen status bars
                       DTDsphere .................... Project initiator
                       Jimmy ........................ "MemenTwo" and "Status Report" fonts
                       Kinsie ....................... Dystopia 3 compatibility
                       m8f .......................... Split status bar for Doom
                       MaxED ........................ Split status bars for Heretic/Hexen
                       Nash Muhandes ................ Widescreen Heretic/Hexen status bars
                                                      Menu tooltips
                       Delfino Furioso .............. Hexen compatibility code patches
                       scar45 ....................... Status bar-aligned stats

===========================================================================
* What is included *

New levels           : None
Sounds               : No
Music                : No
Graphics             : Yes
DEHACKED/BEX Patch   : No
MAPINFO File         : Yes (for loading ZScript)
Demos                : No
Other                : CVARINFO, FONTDEFS, MENUDEF, TEXTURES, ZSCRIPT
Other files required : None


* Play Information *

Game                 : Doom (all), Freedoom, Chex, HacX, Harmony, Heretic, Hexen
Map #                : None
Single Player        : No
Coop 2-4 Player      : No
Deathmatch 2-4 Player: No
Other game styles    : No
Difficulty Settings  : Not implemented


* Construction *

Base                 : Original graphics from IWADs
Build Time           : Too long
Editor(s) used       : SLADE, paint.net
Known Bugs           : None
May Not Run With     : Vanilla executables (not compatible)
Tested With          : GZDoom


* CHANGELOG *

> Version 5.2.0 (xx xx, 2024)
  [ALL] Stats: Added option to position next to statusbar (code by scar45)
  [ALL] Stats: Hours in time widget only shown when needed
  [DOOM] Fix for broken compatibility mode (MD5 hashes) support in GZDoom v4.11.0 and newer. 
         This restores support for the Neural Upscale Pack and many other PWADs which required
         compatibility fixes. Many thanks to AFADoomer and Blue Shadow for the code update!
  [DOOM] Non-split status bar: Fix for STARMS shown in (Alt-)DM
  [DOOM] Split status bar: Support for widescreen bars; currently supports
                           Doom II In City Only, Simulacrum, Spectrum Descent
  [HEXEN] Compatibility with "Hexen Rebalanced" and "Tempered Arms" (code by Delfino Furioso)

> Version 5.1.11 (Jun 7, 2022)
  [ALL] Compatibility fix for stats.zs to support GZDoom v4.8.0+
  [ALL] Stats: Added option to abbreviate stats names (e.g. 'S' instead of 'Secrets')
  [DOOM] Automatic Compatibility: 'Avactor' statusbar improved ('Ammo'/'Health'/'Armor' labels centered)

> Version 5.1.10 (Aug 9, 2021)
  [ALL] Slightly relocated options menu (now shown right below "Alternative HUD Options")
  [ALL] Alignment adjustments for credits
  [DOOM] Automatic Compatibility: "No End In Sight" added
  [HEXEN] Alignment fix for chain covers of unsplit bar (LTEDGE/RTEDGE)

> Version 5.1.9 (May 23, 2021)
  [HERETIC] Updated statusbar (BARBACK/LTFCTOP/RTFCTOP) with Nash's widescreen assets from GZDoom v4.6.0
  [HEXEN] Updated statusbar (H2BAR) with Nash's widescreen assets from GZDoom v4.6.0

> Version 5.1.8 (Mar 23, 2021)
  [ALL] Automatic Compatibility: Hashing system upgraded from MurmurHash2 to the much better MD5, and separated it
                                 into a class in zscript/compat/MD5.zs file. Feel free to use it in your own mods!
  [DOOM] Automatic Compatibility: Mayhem series added
  [CHEX] Corrected some tooltips ("kills") for appropriate naming in Chex Quest
  [HEXEN] Removed needless ARMCLS from health and armor display for improved transparency

> Version 5.1.7 (Mar 17, 2020)
  [ALL] Stats: Powerup timers no longer display when the stats are turned off while powerup position is on
  [ALL] Automap: Option to apply "Traditional Doom/Raven/Strife" colors to normal/overlay automap
  [HERETIC] Split mode: Added invulnerability indicator ("LIFE" and "ARMOR" labels turn golden)
  [HERETIC] Split mode: Improved transparency for key icons

> Version 5.1.6 (Jan 31, 2020)
  [ALL] General Settings: Added "Alternative HUD" control setting (to make sure it is set to OFF)
  [ALL] Stats: Removed 3 redundant/useless stat completion colors
  [ALL] Stats: Added missing tooltips
  [DOOM/HACX] Optional Settings: "Indicate berserk mode" can now choose between red and green cross
  [DOOM] Automatic Compatibility: Community Chest series added
  [HEXEN] Optional Settings: Added option to switch between Armor Class (AC) and armor points
  [HEXEN] Boom HUD colors: Fixed third weapon causing primary ammo to use wrong colors
  [HEXEN] Boom HUD colors: Changed health/armor overmax color from blue to lightblue (better legibility)

> Version 5.1.5 (Jan 8, 2020)
  [ALL] Stats: Can now choose between 25 (before: 3) different stat completion colors

> Version 5.1.4 (Jan 7, 2020)
  NOTE: Now requires GZDoom 4.3.0+ or LZDoom 3.84+. This is due to a major internal restructure that makes
        many parts of the code (especially stats) MUCH easier to maintain, using mixins
  [ALL] General Settings: "Force HUD override" option removed. This was rather hacky and caused crashes, even when turned off
  [ALL] Added tooltips to menu options
  [ALL] All strings (except credits) are now in a LANGUAGE lump. This allows for centralizing the strings and possibly translating
  [ALL] Stats: Added player morph timer from Tekish's LevelInfo v1.23 (mainly for chicken/pig morph in Heretic/Hexen multiplayer)
  [ALL] Split mode: Inventory bar is now properly pre-populated before first scroll through
  [ALL] Split mode: Inventory bar now displays a maximum number of items based on HUD size
  [HERETIC] Automatic compatibility added for Heretic Neural Texture Pack
  [HERETIC] Improved transparency settings for "Curse of D'Sparil"
  [HACX] MENUDEF: No longer needs a separate file, all games now use a single MENUDEF lump

> Version 5.1.3 (Nov 22, 2019)
  NOTE: Now requires GZDoom 4.2.4+. This prevents a segfault that can occur with "Force HUD override" active.
        It is recommended to avoid activating this option in LZDoom (at least for now)
  [ALL] MENUDEF: Reorganization into submenus ("General Settings", "Optional Settings", "Stats")
  [ALL] General Settings: "Force HUD override" option added. This will override any other custom HUD and
                          use this HUD instead, regardless of load order (intended for autoload in particular)
  [ALL] Stats: "Powerup timers" option added. Works exactly the same as in Tekish's LevelInfo v1.22 (for now)
  [ALL] Stats: Fixed top-right stats not moving correctly when the vid_fps CVAR is on
  [ALL] Stats: Active powerup icons (e.g. Tome of Power or Wings of Wrath) no longer block stats
  [DOOM/CHEX/HACX/HERETIC] Secondary ammo now displayed if required (Hexen already did this)
  [DOOM] Automatic compatibility added for Pirate Doom
  [CHEX] Berserk mode indicator CVAR from Doom no longer saved to ini
  [HACX] No longer uses modified STBAR lump, but instead adds a small black patch to cover mugshot background

> Version 5.1.2 (Nov 4, 2019)
  [ALL] MENUDEF: Code optimization (now only HacX needs two files, all other games just one)
  [DOOM] Automatic compatibility added for Sunlust
  [HERETIC] Split mode: Arms numbers are no longer blocked by level stats
  [HEXEN] Split mode: Added support for arms numbers (default: off)
  [HEXEN] Automap: Re-added key/armor panels in minimized mode (graphics were missing)

> Version 5.1.1 (Oct 31, 2019)
  [DOOM] Automatic compatibility added for Eternal Doom, Tangerine Nightmare, Dystopia 3
  [HERETIC] Split mode: Added support for arms numbers (default: off)

> Version 5.1.0 (Oct 2, 2019)
  [DOOM] Automatic compatibility with selected PWADs which needed separate fixes before. Currently included:
         Alien Vendetta, Avactor, Back to Saturn X Ep.1+2, Doom 4 Vanilla, Doom Neural Upscale 2X, Epic 2,
         Eviternity and Memento Mori 2
  [DOOM/CHEX/HACX/HARMONY] Inventory: Amount is now properly right-justified and moved to the correct spot

> Version 5.0.3 (Sep 23, 2019)
  [ALL] Level stats: Fixed stats counting up from 0 after loading savegame
  [ALL] Level stats: Added center left/right positioning

> Version 5.0.2 (Sep 16, 2019)
  NOTE: Now requires GZDoom 4.2.0+ or LZDoom 3.83+
  [ALL] Level stats: Available fonts are now "Default", "Console Font", "Memento Mori 2" and "Status Report" (new)
  [ALL] Level stats: Interpolation added
  [ALL] Level stats: Realignments/scaling adjustments for all font types
  [ALL] Level stats: Fixed incorrect stats order in bottom-right corner
  [HARMONY] Ammo counters now work correctly

> Version 5.0.1 (Sep 6, 2019)
  [ALL] Level stats: Added option to change stats font. 5 choices available (default: font from 4.x releases)

> Version 5.0 (Sep 4, 2019)
  NOTE: It is recommended to clean your GZDoom ini from all CVAR entries of earlier releases.
        Before using this version, search for any ini entry starting with "fullhud_",
        delete all those lines, save the file, then launch the game with the new mod
  [ALL] Complete rewrite of the entire mod in ZScript, done by 3saster
  [ALL] Status bar changes are now instantaneous (leaving the menu is no longer required to see differences)
  [ALL] Split mode is now the new default (should make it easier to see if you are in fullscreen mode or not)
  [ALL] Transparency features:
           - Now has 11 settings: 0.0 (off), 0.1-0.9, 1.0 (full)
           - Option for opaque numbers and graphics (not affected by transparency settings)
  [ALL] Level stats system overhaul:
           - Percentage, countdown and a new fraction mode (found/killed/total) are supported
           - Uses the GZDoom console font now (easy to read and guaranteed to be the same in any PWAD)
           - Stats are now independent of each other and can be placed in any corner of the screen (or disabled)
           - Stats now always aligning to each other in the same corner (dynamically adjust to the longest line)
           - Stats aligned to the bottom in split mode will now sit on top of the status bar
           - Any stat can now turn green (default) or red when reaching 100% completion (can also be disabled)
  [ALL] Boom HUD colors: Ammo counter now takes backpack into consideration; armor value now accurately
                         displays protection level (should account for possible DEHACKED changes)
  [ALL] Level stats: Time display now shows hub time if available, otherwise map time
  [ALL] Credits subpage (with version number) added to menu
  [DOOM/CHEX/HACX/HERETIC] New option to choose whether to show status bar on automap or not
  [DOOM/CHEX/HACX] Split mode: Added frags counter (DM only)
  [DOOM/CHEX/HACX] Split mode: Moved selected inventory item next to the mugshot (w/o mugshot replacement)
                               for new stats display
  [DOOM/CHEX/HACX] Selected inventory item now properly centered
  [DOOM/CHEX/HACX] Will work with some WADs based on DECORATE/ZScript (e.g. works with dead.air)
  [DOOM/CHEX/HACX] Removed "Interpolate health & armor" (useless feature)
  [CHEX/HACX/HARMONY] Removed Strife color scheme as predefined automap setting
  [CHEX] When BOOM HUD colors are on, the color of health > 100 and blue armor is now LIGHTBLUE
  [CHEX] Berserk display option hidden. If a berserk pack is found, it will still be shown
         if CVAR fullhud_showberserk=true (can only be done from console)
  [CHEX] Non-split mode: "Frag" display added (DM only)
  [CHEX] "Kills" stats renamed to "Zorch"
  [HACX] Split mode: Colors of arms numbers are now inverted (dark=missing, bright=obtained)
  [HACX] Boom color mode now hidden from menu
  [HERETIC/HEXEN] Split mode: "Kills" display implemented differently (DM only)
  [HERETIC] Non-split mode: Addressed issue with transparent status bar having its life chain
                            shining through the bottom of the demon heads (not fixed, but better)
  [HERETIC] Non-split mode: Status bar now properly centered
  [HERETIC] Split mode: Chain on left side centered
  [HERETIC] Split mode: Black area on the left side will match MP color
  [HERETIC] DM support added: Health -> Kills in non-split mode; Kills counter added in split mode
  [HERETIC] All Doom-specific options hidden in menu
  [HEXEN] Non-split mode: Corrected misaligned graphics which have been wrong in Hexen since its release
  [HEXEN] Split mode: Selected inventory item now shown next to the right status bar panel
  [HEXEN] Automap view: New minimized version (icons instead of panels, only show if keys/armor in inventory)
  [HEXEN] Boom colors: Better support for AC display

> Version 4.10 (Aug 8, 2019)
  [ALL] Menu/Status Bar Appearance: "Transparency" setting reverted to pre-4.9 state (no slider)
  [DOOM/CHEX/HACX/FREEDOOM] Universal compatibility for widescreen status bars (thanks to bangstk)
  [DOOM/CHEX/HACX] Fix for mugshot disappearing when "Inventory items can replace mugshot" is off
  [DOOM] Menu/Optional Settings: New option "Indicate Berserk mode" (default: off)
  [CHEX/HACX] Minor SBARINFO code adjustments/optimizations

> Version 4.9 (Aug 5, 2019)
  [ALL] Lump filtering for CVARINFO (only saves CVARs to ini which are required for a specific game)
  [ALL] Menu/Status Bar Appearance: "Transparency" setting is now a slider (0-3)
  [CHEX] Menu/Optional Settings: New option "Replace Chex logos" (default: off) to show Arms/ammo overview
  [CHEX] Ammo overview numbers now white instead of green

> Version 4.8.3 (Aug 2, 2019)
  [ALL] Menu: Renamed some options for better understanding

> Version 4.8.2 (Jul 31, 2019)
  [DOOM/CHEX/HACX] Menu/Optional Settings: New option "Interpolate health & armor" (default: off)

> Version 4.8.1 (July 29, 2019)
  [ALL] Menu: Now displays version number
  [ALL] Menu/Level Stats: "Full Stats" and "Position" now cannot be changed when "Display" is "Off"
  [DOOM/CHEX] Menu/Optional Settings: "Arms on Split Bar" now cannot be changed when "Splitting" is "Off"

> Version 4.8 (May 27, 2019)
  [ALL] Menu/Level Stats: New option "Full Stats" (On: S/I/K counters, Off: S/K counters only)
  [ALL] Level Stats: Different alignment for countdown display in top/bottom left position
  [HERETIC/HEXEN] Split bar: Inventory bar size now scales with hud_scale setting
  [HACX] SBARINFO added to fix non-functional ammo overview & remove useless Boom color mode entirely

> Version 4.7.6 (Apr 29, 2019)
  [ALL] Menu: "Level Stats" options now separated from "Optional Settings"
  [DOOM/CHEX] Split bar: ARMS numbers can now be turned off (default: on)

> Version 4.7.5 (Mar 16, 2019)
  [DOOM/CHEX] INDEXFONT for secondary ammo display replaced with SMALLFONT

> Version 4.7.4 (Mar 14, 2019)
  [DOOM/CHEX] Secondary ammo display support

> Version 4.7.3 (Mar 7, 2019)
  [DOOM/CHEX] Split bar: ARMS numbers added to left panel (on top of mugshot)

> Version 4.7.2 (Mar 6, 2019)
  [ALL] Level stats: Numbers now interpolated
  [DOOM/CHEX] Menu: Renamed option "Mugshot Replacement" to "Mugshot Inventory"

> Version 4.7.1 (Mar 5, 2019)
  [DOOM/CHEX] Inventory bar modification (mugshot replaced by selected inventory item now optional)

> Version 4.7 (Mar 4, 2019)
  [ALL] Level stats: Option to change position (top left/right, bottom left/right)
  [DOOM/CHEX] Fallback option for mods not using standard ammo in Boom color mode

> Version 4.6.1 (Dec 13, 2018)
  [DOOM/CHEX/HERETIC] Automap: Removed status bar completely

> Version 4.6 (Nov 2, 2018)
  [ALL] Level stats: Time display reverted to pre-4.32 state (SBARINFO solution instead of ACS)
  [ALL] ACS: Minor code optimizations for countdown calculation
  [HERETIC/HEXEN] Boom colors now available
  [HERETIC/HEXEN] Menu: Automap background option removed
  [HEXEN] Split version: Gargoyles and center panel graphics removed
  [HEXEN] Split version: Selected inventory item moved from bottom center to bottom right
  [HEXEN] Automap: Gargoyles removed

> Version 4.5 (Oct 24, 2018)
  [ALL] Menu: Can now choose between 3 degrees of transparency
  [ALL] Transparency: Only background images are affected by transparency (mugshot, numbers and keys stay opaque)
  [HERETIC] Minor transparency tuning
  [HEXEN] Mana bars: Improved transparency

> Version 4.4 (Oct 22, 2018)
  [ALL] Level stats: Code optimization
  [DOOM/CHEX] Automap: Mugshot and ammo counters removed (to gain more space for map title)

> Version 4.3.2 (Oct 19, 2018)
  [ALL] Level stats: Hours now only shown when needed
  [ALL] Level stats: Countdown numbers increased from 4 digits to 5 (capped at 99.999)
  [ALL] Level stats: Global variables changed from 1-9 to 51-59 (avoids conflicts with scripts from other mods)

> Version 4.3.1 (Oct 15, 2018)
  [DOOM/CHEX] Armor counter numbers not drawn twice any more in Boom mode

> Version 4.3 (Oct 12, 2018)
  [ALL] Level stats: Time display added (optional, select it via menu)
  [ALL] Level stats: Switching between modes now works without level restart
  [ALL] Level stats: "Countdowns" numbers placed before "Kills/Items/Scrts Left" text
  [ALL] Level stats: STATS1/STATS2 graphics slightly resized
  [HERETIC/HEXEN] Level stats: Aligned to top right corner (again)

> Version 4.2.2 (Oct 10, 2018)
  [ALL] Level stats: Modification of STATS1 (percentage signs are now white)

> Version 4.2.1 (Oct 9, 2018)
  [ALL] Level stats: Minor realignments of graphics
  [ALL] Level stats: Unified/global font for counters

> Version 4.2 (Oct 8, 2018)
  [ALL] Level stats: New counter type: "Countdowns"
  [ALL] SBARINFO code efficiency update (size reduced)
  [DOOM/CHEX/HERETIC/HEXEN] Level stats: Counter numbers are now white (not in Harmony and HacX)
  [CHEX] FONTDEFS removed (no longer needed)

> Version 4.1 (Oct 1, 2018)
  [HERETIC/HEXEN] Inventory bar now also integrated into transparent (centered) status bar

> Version 4.0 (Sep 28, 2018)
  [INFO] Now uses "height 0" to redraw the original (non-fullscreen) status bars.
         Normal status bars can still be used with some limitations (but still NOT recommended).
  [ALL] Option added to choose between normal and split status bars
  [ALL] Automap always uses split versions (to increase viewing area)
  [ALL] Fullscreen status bar scaling now also affects automap
  [ALL] Option menu changes:
           - Now divided into two groups: "Status Bar Appearance", "Optional Settings"
           - All toggles changed to simple "On"/"Off" choices
           - "Optional Settings": Automap background can now be deactivated (Heretic/Hexen only)
  [CHEX] Realignment of ammo, health and armor counters

> Version 3.1.1 (Sep 22, 2018)
  [DOOM] Boom status bar colors should now work with most customized PWAD status bars

> Version 3.1 (Sep 21, 2018)
  [ALL] Added option to use Boom colors for Doom status bar numbers
        (Note: Not available in Heretic or Hexen)
  [ALL: TRANSPARENT] Ammo, health and armor counters are now always opaque
                     (also solves problem with Boom armor counter)
  [ALL] Level stats transparency slightly reduced (from alpha 0.6 to 0.7)
  [ALL] "Show Level Stats" options renamed (from "Off"/"On" to "No"/"Yes")
  [ALL] "Status Bar Style" renamed to "Status Bar Rendering"
  [CHEX/HERETIC/HEXEN] Changed lump filtering to fix unsupported games (e.g. Blasphemer)
  [HERETIC: TRANSPARENT] Fix/improvement for glowing gargoyle eyes (god mode)

> Version 3.0 (Sep 19, 2018)
  [ALL] Transparent and opaque versions merged
  [ALL] Option menu added ("HUD Options" > "Fullscreen Status Bar")
  [ALL] Level stats can now be turned off

> Version 2.7 (Sep 18, 2018)
  [ALL] Level stats now with percentages instead of counters (ACS)
  [ALL: OPAQUE] Optimized contents for opacity (needless graphics and code removed)
  [HEXEN: OPAQUE] Fix for life chain shining through status bar on the lower right side
  [DOOM/CHEX/HACX/HARMONY] Fixed potential problem with wrong fullscreenoffsets for mugshot
  [DOOM/CHEX/HACX/HARMONY: TRANSPARENT] Transparency for ammo/health/armor counters
                                        slightly increased (from alpha 0.8 to 0.7)

> Version 2.6.1 (Sep 11, 2018)
  [ALL] Applied PNG compression to all graphics, reducing file size by over 40%

> Version 2.6 (Sep 10, 2018)
  [HEXEN] Standard status bar now properly aligned
  [HEXEN] Mana counters moved 1px to the left to match standard status bar
  [DOOM/CHEX/HACX/HARMONY] Moved BACKGRND to game-doomchex filter folder
  [DOOM/CHEX/HACX/HARMONY] Different drawing method for automap status bar background
                           (BACKGRND is now 640x32 instead of 1920x32)

> Version 2.5 (Sep 7, 2018)
  [HERETIC/HEXEN] Level stats aligned to the upper left instead of upper right corner
                  (to avoid collision with active powerup icons)
  [CHEX/HACX/HARMONY] Use Strife-style automap color scheme
                      ("Automap Options" > "Allow Map Defined Colors" must be set to "Yes")
  [DOOM/CHEX/HACX/HARMONY] Minor (invisible) optimization of how automap status bar is
                           created (BACKGRND and STBAR merged in TEXTURES.DOOM)

> Version 2.4 (Aug 13, 2018)
  [HERETIC/HEXEN: TRANSPARENT] Fix for inventory bar not properly aligned
  [HERETIC/HEXEN: OPAQUE] Inventory bar (re)integrated into status bar (like in vanilla)
  [HERETIC] Alignment correction for inventory item counter
  [HEXEN] Status bar updated with neoworm's latest version

> Version 2.3 (Feb 26, 2018)
  [ALL] Non-transparent status bar version available (separate version)
  [HEXEN] Fix for mana icon alignment

> Version 2.2.1 (Oct 11, 2017)
  [ALL] Level stats no longer use abbreviations; gapfiller zeroes removed

> Version 2.2 (May 10, 2017)
  [DOOM/CHEX/HACX/HARMONY] Black background fix for automap status bar now supports
                           up to 1920px screen width when scaled to 1
  [HEXEN] More status bar alignment adjustments

> Version 2.1 (May 9, 2017)
  [CHEX/HACX/HARMONY] Support added
  [DOOM/CHEX/HACX/HARMONY] Black background for automap status bar (borderflat invisible)
  [HEXEN] More status bar alignment adjustments

> Version 2.0 (May 2, 2017)
  [ALL] Single file solution for Doom, Heretic and Hexen (uses lump filtering)
  [ALL] Alignment fix for level stats (now stays aligned to the upper right screen corner)
  [HEXEN] Status bar alignment adjustments

> Version 1.1 (Dec 12, 2016)
  [ALL] Level stats added

> Version 1.0 (Nov 30, 2016)
  [ALL] Initial release by DTDsphere
