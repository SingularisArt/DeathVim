-------------------
-- Core Settings --
-------------------

local autoload = require('SingularisArt.autoload')

local SingularisArt = autoload('SingularisArt')

-- Using a real global here to make sure anything stashed in here (and
-- in `SingularisArt.g`) survives even after the last reference to it goes away.
_G.SingularisArt = SingularisArt

require("SingularisArt.core.settings")
require("SingularisArt.core.commands")
require("SingularisArt.core.keymappings")

require("SingularisArt.theme")
require("SingularisArt.lsp")

return SingularisArt
