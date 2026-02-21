-- Diagnostics and LSP highlights for Islands Dark theme

local M = {}

--- Diagnostics and LSP highlights
--- This includes highlights for diagnostic messages, LSP references, signature help, inlay hints, and code lens.
--- The colors are based on the theme's color palette, and styles can be customized through the user configuration.
--- @param c table Color palette
function M.setup(c)
	local highlights = {}

	-- Diagnostics (inline text)
	highlights.DiagnosticError = { fg = c.error }
	highlights.DiagnosticWarn = { fg = c.warning }
	highlights.DiagnosticInfo = { fg = c.info }
	highlights.DiagnosticHint = { fg = c.hint }
	highlights.DiagnosticOk = { fg = c.string }

	-- Diagnostics (underline)
	highlights.DiagnosticUnderlineError = { sp = c.error, undercurl = true }
	highlights.DiagnosticUnderlineWarn = { sp = c.warning, undercurl = true }
	highlights.DiagnosticUnderlineInfo = { sp = c.info, undercurl = true }
	highlights.DiagnosticUnderlineHint = { sp = c.hint, undercurl = true }
	highlights.DiagnosticUnderlineOk = { sp = c.string, undercurl = true }

	-- Diagnostics (virtual text)
	highlights.DiagnosticVirtualTextError = { fg = c.error }
	highlights.DiagnosticVirtualTextWarn = { fg = c.warning }
	highlights.DiagnosticVirtualTextInfo = { fg = c.info }
	highlights.DiagnosticVirtualTextHint = { fg = c.hint }
	highlights.DiagnosticVirtualTextOk = { fg = c.string }

	-- Diagnostics (signs in gutter)
	highlights.DiagnosticSignError = { fg = c.error, bg = c.none }
	highlights.DiagnosticSignWarn = { fg = c.warning, bg = c.none }
	highlights.DiagnosticSignInfo = { fg = c.info, bg = c.none }
	highlights.DiagnosticSignHint = { fg = c.hint, bg = c.none }
	highlights.DiagnosticSignOk = { fg = c.string, bg = c.none }

	-- Diagnostics (floating windows)
	highlights.DiagnosticFloatingError = { fg = c.error, bg = c.none }
	highlights.DiagnosticFloatingWarn = { fg = c.warning, bg = c.none }
	highlights.DiagnosticFloatingInfo = { fg = c.info, bg = c.none }
	highlights.DiagnosticFloatingHint = { fg = c.hint, bg = c.none }
	highlights.DiagnosticFloatingOk = { fg = c.string, bg = c.none }

	-- LSP references
	highlights.LspReferenceText = { bg = c.identifier_under_caret_bg }
	highlights.LspReferenceRead = { bg = c.identifier_under_caret_bg }
	highlights.LspReferenceWrite = { bg = c.write_identifier_bg }

	-- LSP signature help
	highlights.LspSignatureActiveParameter = { fg = c.parameter, bold = true }

	-- LSP inlay hints
	highlights.LspInlayHint = { fg = c.fg_dimmer }

	-- LSP Code Lens
	highlights.LspCodeLens = { fg = c.fg_dimmer }
	highlights.LspCodeLensSeparator = { fg = c.border }

	return highlights
end

return M
