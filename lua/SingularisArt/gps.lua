local status_ok, gps = pcall(require, "nvim-gps")
if not status_ok then
	return
end

local icons = require("SingularisArt.icons")

local space = ""

if vim.fn.has("mac") == 1 then
	space = " "
end

-- Customized config
gps.setup({
	disable_icons = false,
	icons = {
		["class-name"] = "%#CmpItemKindClass#" .. icons.kind.Class .. "%*" .. space,
		["function-name"] = "%#CmpItemKindFunction#" .. icons.kind.Function .. "%*" .. space,
		["method-name"] = "%#CmpItemKindMethod#" .. icons.kind.Method .. "%*" .. space,
		["container-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. space,
		["tag-name"] = "%#CmpItemKindKeyword#" .. icons.misc.Tag .. "%*" .. " ",
		["mapping-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. space,
		["sequence-name"] = "%#CmpItemKindProperty#" .. icons.type.Array .. "%*" .. space,
		["null-name"] = "%#CmpItemKindField#" .. icons.kind.Field .. "%*" .. space,
		["boolean-name"] = "%#CmpItemKindValue#" .. icons.type.Boolean .. "%*" .. space,
		["integer-name"] = "%#CmpItemKindValue#" .. icons.type.Number .. "%*" .. space,
		["float-name"] = "%#CmpItemKindValue#" .. icons.type.Number .. "%*" .. space,
		["string-name"] = "%#CmpItemKindValue#" .. icons.type.String .. "%*" .. space,
		["array-name"] = "%#CmpItemKindProperty#" .. icons.type.Array .. "%*" .. space,
		["object-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. space,
		["number-name"] = "%#CmpItemKindValue#" .. icons.type.Number .. "%*" .. space,
		["table-name"] = "%#CmpItemKindProperty#" .. icons.ui.Table .. "%*" .. space,
		["date-name"] = "%#CmpItemKindValue#" .. icons.ui.Calendar .. "%*" .. space,
		["date-time-name"] = "%#CmpItemKindValue#" .. icons.ui.Table .. "%*" .. space,
		["inline-table-name"] = "%#CmpItemKindProperty#" .. icons.ui.Calendar .. "%*" .. space,
		["time-name"] = "%#CmpItemKindValue#" .. icons.misc.Watch .. "%*" .. space,
		["module-name"] = "%#CmpItemKindModule#" .. icons.kind.Module .. "%*" .. space,
	},
	separator = " " .. icons.ui.ChevronRight .. " ",
	depth = 0,
	depth_limit_indicator = "..",
	text_hl = "LineNr",
})
