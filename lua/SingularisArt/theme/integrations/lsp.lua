local M = {}

function M.get(cp)
	local error = cp.red
	local warning = cp.yellow
	local info = cp.sky
	local hint = cp.rosewater

	return {
		LspReferenceText = { bg = cp.black4 }, -- used for highlighting "text" references
		LspReferenceRead = { bg = cp.black4 }, -- used for highlighting "read" references
		LspReferenceWrite = { bg = cp.black4 }, -- used for highlighting "write" references
		-- hightlight diagnostics in numberline
		DiagnosticError = { fg = error, style = 'italic' }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticWarn = { fg = warning, style = 'italic' }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticInfo = { fg = info, style = 'italic' }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
		DiagnosticHint = { fg = hint, style = 'italic' }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

		-- for nvim nightly
		DiagnosticUnderlineError = { style = 'undercurl', sp = error },
		DiagnosticUnderlineWarn = { style = 'undercurl', sp = warning },
		DiagnosticUnderlineInfo = { style = 'undercurl', sp = info },
		DiagnosticUnderlineHint = { style = 'undercurl', sp = hint },

		LspDiagnosticsDefaultError = { fg = error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultWarning = { fg = warning }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultInformation = { fg = info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspDiagnosticsDefaultHint = { fg = hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
		LspSignatureActiveParameter = { fg = cp.peach },

		LspDiagnosticsError = { fg = error },
		LspDiagnosticsWarning = { fg = warning },
		LspDiagnosticsInformation = { fg = info },
		LspDiagnosticsHint = { fg = hint },
		LspDiagnosticsVirtualTextError = { fg = error, style = 'italic' }, -- Used for "Error" diagnostic virtual text
		LspDiagnosticsVirtualTextWarning = { fg = warning, style = 'italic' }, -- Used for "Warning" diagnostic virtual text
		LspDiagnosticsVirtualTextInformation = { fg = info, style = 'italic' }, -- Used for "Information" diagnostic virtual text
		LspDiagnosticsVirtualTextHint = { fg = hint, style = 'italic' }, -- Used for "Hint" diagnostic virtual text
		LspDiagnosticsUnderlineError = { style = 'undercurl', sp = error }, -- Used to underline "Error" diagnostics
		LspDiagnosticsUnderlineWarning = { style = 'undercurl', sp = warning }, -- Used to underline "Warning" diagnostics
		LspDiagnosticsUnderlineInformation = { style = 'undercurl', sp = info }, -- Used to underline "Information" diagnostics
		LspDiagnosticsUnderlineHint = { style = 'undercurl', sp = hint }, -- Used to underline "Hint" diagnostics
		LspCodeLens = { fg = cp.gray0 }, -- virtual text of the codelens
	}
end

return M

