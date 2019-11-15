version "4.2.4"

// The main status bars (split and unsplit)
#include "zscript/statusbars/main.zs"
#include "zscript/statusbars/unsplit.zs"
#include "zscript/statusbars/split.zs"

// Stuff involved for drawing stats
#include "zscript/stats/statfonts.zs"
#include "zscript/stats/stats.zs"

// Boom colors
#include "zscript/boomcolors.zs"

// Compatibility for doom-based IWADs & PWADs
#include "zscript/compat_iwad.zs"
#include "zscript/compat_general.zs"

// Functions that lack transparency natively
#include "zscript/trans.zs"