-- LSP semantic token highlights for Islands Dark theme

local M = {}

--- Setup LSP semantic token highlights
--- @param c table Color palette
--- @param config table User configuration
--- @param util table Utility functions
--- @return table Highlight groups for LSP semantic tokens
function M.setup(c, config, util)
	local highlights = {}

	-- Namespaces and modules
	highlights["@lsp.type.namespace"] = { fg = c.type }
	highlights["@lsp.type.module"] = { fg = c.type }

	-- Types
	highlights["@lsp.type.type"] = { fg = c.type }
	highlights["@lsp.type.class"] = { fg = c.type }
	highlights["@lsp.type.enum"] = { fg = c.type }
	highlights["@lsp.type.interface"] = { fg = c.type }
	highlights["@lsp.type.struct"] = { fg = c.type }
	highlights["@lsp.type.typeParameter"] = { fg = c.type }

	-- Functions and methods
	local function_style = util.get_style(config, "functions")
	highlights["@lsp.type.function"] = { fg = c.func, bold = function_style.bold, italic = function_style.italic }
	highlights["@lsp.type.method"] = { fg = c.method }
	highlights["@lsp.type.macro"] = { fg = c.metadata }
	highlights["@lsp.type.decorator"] = { fg = c.metadata }

	-- Variables
	local variable_style = util.get_style(config, "variables")
	highlights["@lsp.type.variable"] = { fg = c.variable, bold = variable_style.bold, italic = variable_style.italic }
	highlights["@lsp.type.parameter"] = { fg = c.parameter }
	highlights["@lsp.type.property"] = { fg = c.property }
	highlights["@lsp.type.field"] = { fg = c.field }
	highlights["@lsp.type.enumMember"] = { fg = c.enum_member }

	-- Keywords
	local keyword_style = util.get_style(config, "keywords")
	highlights["@lsp.type.keyword"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }

	-- Comments
	local comment_style = util.get_style(config, "comments")
	highlights["@lsp.type.comment"] = { fg = c.comment, bold = comment_style.bold, italic = comment_style.italic }

	-- Modifiers
	local constant_style = util.get_style(config, "constants")
	highlights["@lsp.mod.readonly"] = { fg = c.constant, bold = constant_style.bold, italic = constant_style.italic }
	highlights["@lsp.mod.constant"] = { fg = c.constant, bold = constant_style.bold, italic = constant_style.italic }
	highlights["@lsp.mod.static"] = { fg = c.constant, bold = constant_style.bold, italic = constant_style.italic }
	highlights["@lsp.mod.deprecated"] = { fg = c.deprecated }
	highlights["@lsp.mod.abstract"] = {}
	highlights["@lsp.mod.defaultLibrary"] = { fg = c.keyword }

	-- Specific language semantic tokens
	highlights["@lsp.typemod.variable.readonly"] = { fg = c.constant, bold = constant_style.bold, italic = constant_style.italic }
	highlights["@lsp.typemod.variable.constant"] = { fg = c.constant, bold = constant_style.bold, italic = constant_style.italic }
	highlights["@lsp.typemod.variable.defaultLibrary"] = { fg = c.keyword }
	highlights["@lsp.typemod.function.defaultLibrary"] = { fg = c.func, bold = function_style.bold, italic = function_style.italic }
	highlights["@lsp.typemod.method.defaultLibrary"] = { fg = c.method }
	highlights["@lsp.typemod.type.defaultLibrary"] = { fg = c.keyword }
	highlights["@lsp.typemod.type.definition"] = { fg = c.type_definition }
	highlights["@lsp.typemod.class.declaration"] = { fg = c.type_definition }
	highlights["@lsp.typemod.interface.declaration"] = { fg = c.type_definition }

	-- Go-specific LSP semantic tokens
	highlights["@lsp.type.namespace.go"] = { fg = c.metadata }

	return highlights
end

return M
