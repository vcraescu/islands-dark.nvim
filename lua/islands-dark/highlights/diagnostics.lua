local M = {}

--- Diagnostics and LSP highlights
--- This includes for diagnostic messages, LSP references, signature help, inlay hints, and code lens.
--- The colors are based on the theme's color palette, and styles can be customized through the user configuration.
--- @param c theme.Colors Color palette
--- @return table Highlight groups for diagnostics and LSP features
function M.get(c)
	return {
		-- Diagnostics (inline text)
		DiagnosticError = { fg = c.error },
		DiagnosticWarn = { fg = c.warning },
		DiagnosticInfo = { fg = c.info },
		DiagnosticHint = { fg = c.hint },
		DiagnosticOk = { fg = c.string },

		-- Diagnostics (underline)
		DiagnosticUnderlineError = { sp = c.error, undercurl = true },
		DiagnosticUnderlineWarn = { sp = c.warning, undercurl = true },
		DiagnosticUnderlineInfo = { sp = c.info, undercurl = true },
		DiagnosticUnderlineHint = { sp = c.hint, undercurl = true },
		DiagnosticUnderlineOk = { sp = c.string, undercurl = true },

		-- Diagnostics (virtual text)
		DiagnosticVirtualTextError = { fg = c.error },
		DiagnosticVirtualTextWarn = { fg = c.warning },
		DiagnosticVirtualTextInfo = { fg = c.info },
		DiagnosticVirtualTextHint = { fg = c.hint },
		DiagnosticVirtualTextOk = { fg = c.string },

		-- Diagnostics (signs in gutter)
		DiagnosticSignError = { fg = c.error, bg = c.none },
		DiagnosticSignWarn = { fg = c.warning, bg = c.none },
		DiagnosticSignInfo = { fg = c.info, bg = c.none },
		DiagnosticSignHint = { fg = c.hint, bg = c.none },
		DiagnosticSignOk = { fg = c.string, bg = c.none },

		-- Diagnostics (floating windows)
		DiagnosticFloatingError = { fg = c.error, bg = c.none },
		DiagnosticFloatingWarn = { fg = c.warning, bg = c.none },
		DiagnosticFloatingInfo = { fg = c.info, bg = c.none },
		DiagnosticFloatingHint = { fg = c.hint, bg = c.none },
		DiagnosticFloatingOk = { fg = c.string, bg = c.none },

		-- LSP references
		LspReferenceText = { bg = c.lsp_reference },
		LspReferenceRead = { bg = c.lsp_reference },
		LspReferenceWrite = { bg = c.lsp_reference },

		-- LSP signature help
		LspSignatureActiveParameter = { fg = c.parameter, bold = true },

		-- LSP inlay hints
		LspInlayHint = { fg = c.fg1 },

		-- LSP Code Lens
		LspCodeLens = { fg = c.fg1 },
		LspCodeLensSeparator = { fg = c.border },
	}
end

return M
