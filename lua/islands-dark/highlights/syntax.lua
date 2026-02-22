-- Basic syntax highlights for Islands Dark theme

local M = {}

--- Setup syntax highlight groups
--- @param c table Color palette
--- @param config table User configuration
--- @return table Highlight groups for syntax elements
function M.setup(c, config)
	local highlights = {}
	local util = require("islands-dark.util")
	local constant_style = util.get_style(config, "constants")
	local comment_style = util.get_style(config, "comments")
	local variable_style = util.get_style(config, "variables")
	local function_style = util.get_style(config, "functions")
	local string_style = util.get_style(config, "strings")
	local keyword_style = util.get_style(config, "keywords")

	-- Comments
	highlights.Comment = { fg = c.comment, bold = comment_style.bold, italic = comment_style.italic }

	-- Constants
	highlights.Constant = { fg = c.constant, bold = constant_style.bold, italic = constant_style.italic }
	highlights.String = { fg = c.string, bold = string_style.bold, italic = string_style.italic }
	highlights.Character = { fg = c.string }
	highlights.Number = { fg = c.number }
	highlights.Boolean = { link = "Keyword" }
	highlights.Float = { fg = c.number }

	-- Identifiers
	highlights.Identifier = { fg = c.variable, bold = variable_style.bold, italic = variable_style.italic }
	highlights.Function = { fg = c.func, bold = function_style.bold, italic = function_style.italic }

	-- Statements
	highlights.Statement = { link = "Keyword" }
	highlights.Conditional = { link = "Keyword" }
	highlights.Repeat = { link = "Keyword" }
	highlights.Label = { fg = c.label }
	highlights.Operator = { fg = c.operator }
	highlights.Keyword = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights.Exception = { link = "Keyword" }

	-- PreProc
	highlights.PreProc = { fg = c.metadata }
	highlights.Include = { link = "Keyword" }
	highlights.Define = { link = "Keyword" }
	highlights.Macro = { fg = c.metadata }
	highlights.PreCondit = { link = "Keyword" }

	-- Types
	highlights.Type = { fg = c.type }
	highlights.StorageClass = { link = "Keyword" }
	highlights.Structure = { link = "Keyword" }
	highlights.Typedef = { fg = c.type_definition, bold = keyword_style.bold, italic = keyword_style.italic }

	-- Special
	highlights.Special = { fg = c.special }
	highlights.SpecialChar = { link = "Special" }
	highlights.Tag = { fg = c.tag }
	highlights.Delimiter = { fg = c.punctuation }
	highlights.SpecialComment = { fg = c.doc_comment }
	highlights.Debug = { fg = c.warning }

	-- Other
	highlights.Underlined = { fg = c.hyperlink, underline = true }
	highlights.Ignore = { fg = c.fg_dimmer }
	highlights.Error = { fg = c.error }
	highlights.Todo = { fg = c.todo, bold = true }

	return highlights
end

return M
