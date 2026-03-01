local M = {}

--- Diagnostics and LSP highlights
--- This includes for diagnostic messages, LSP references, signature help, inlay hints, and code lens.
--- The colors are based on the theme's color palette, and styles can be customized through the user configuration.
--- @param c theme.Colors Color palette
--- @return table Highlight groups for diagnostics and LSP features
function M.get(c)
	return {
		DiagnosticError = { fg = c.error },
		DiagnosticFloatingError = { fg = c.error, bg = c.none },
		DiagnosticFloatingHint = { fg = c.hint, bg = c.none },
		DiagnosticFloatingInfo = { fg = c.info, bg = c.none },
		DiagnosticFloatingOk = { fg = c.string, bg = c.none },
		DiagnosticFloatingWarn = { fg = c.warning, bg = c.none },
		DiagnosticHint = { fg = c.hint },
		DiagnosticInfo = { fg = c.info },
		DiagnosticOk = { fg = c.string },
		DiagnosticSignError = { fg = c.error, bg = c.none },
		DiagnosticSignHint = { fg = c.hint, bg = c.none },
		DiagnosticSignInfo = { fg = c.info, bg = c.none },
		DiagnosticSignOk = { fg = c.string, bg = c.none },
		DiagnosticSignWarn = { fg = c.warning, bg = c.none },
		DiagnosticUnderlineError = { fg = c.error, undercurl = true },
		DiagnosticUnderlineHint = { fg = c.hint, undercurl = true },
		DiagnosticUnderlineInfo = { fg = c.info, undercurl = true },
		DiagnosticUnderlineOk = { fg = c.string, undercurl = true },
		DiagnosticUnderlineWarn = { fg = c.warning, undercurl = true },
		DiagnosticVirtualTextError = { fg = c.error },
		DiagnosticVirtualTextHint = { fg = c.hint },
		DiagnosticVirtualTextInfo = { fg = c.info },
		DiagnosticVirtualTextOk = { fg = c.string },
		DiagnosticVirtualTextWarn = { fg = c.warning },
		DiagnosticWarn = { fg = c.warning },
		LspCodeLens = { fg = c.text2 },
		LspCodeLensSeparator = { fg = c.border },
		LspInlayHint = { fg = c.text2 },
		LspReferenceRead = { bg = c.lsp_reference },
		LspReferenceText = { bg = c.lsp_reference },
		LspReferenceWrite = { bg = c.lsp_reference },
		LspSignatureActiveParameter = { fg = c.parameter, bold = true },
	}
end

return M
