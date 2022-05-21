-------------------
-- Core Settings --
-------------------

local autoload = require('SingularisArt.autoload')
local call = require('SingularisArt.call')

local SingularisArt = autoload('SingularisArt')
table.insert(SingularisArt, call)

-- Using a real global here to make sure anything stashed in here (and
-- in `SingularisArt.g`) survives even after the last reference to it goes away.
_G.SingularisArt = SingularisArt

require("SingularisArt.core.commands")
require("SingularisArt.core.keymappings")
require("SingularisArt.core.settings")

return SingularisArt
