-- Basic syntax highlights for Islands Dark theme

local M = {}

--- Setup syntax highlight groups
--- @param c table Color palette
--- @param config table User configuration
--- @param util table Utility functions
--- @return table Highlight groups for syntax elements
function M.setup(c, config, util)
	local highlights = {}

	-- Comments
	local comment_style = util.get_style(config, "comments")
	highlights.Comment = { fg = c.comment, bold = comment_style.bold, italic = comment_style.italic }

	-- Constants
	local constant_style = util.get_style(config, "constants")
	highlights.Constant = { fg = c.constant, bold = constant_style.bold, italic = constant_style.italic }
	local string_style = util.get_style(config, "strings")
	highlights.String = { fg = c.string, bold = string_style.bold, italic = string_style.italic }
	highlights.Character = { fg = c.string }
	highlights.Number = { fg = c.number }
	highlights.Boolean = { fg = c.keyword }
	highlights.Float = { fg = c.number }

	-- Identifiers
	local variable_style = util.get_style(config, "variables")
	highlights.Identifier = { fg = c.variable, bold = variable_style.bold, italic = variable_style.italic }
	local function_style = util.get_style(config, "functions")
	highlights.Function = { fg = c.func, bold = function_style.bold, italic = function_style.italic }

	-- Statements
	local keyword_style = util.get_style(config, "keywords")
	highlights.Statement = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights.Conditional = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights.Repeat = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights.Label = { fg = c.label }
	highlights.Operator = { fg = c.operator }
	highlights.Keyword = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights.Exception = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }

	-- PreProc
	highlights.PreProc = { fg = c.metadata }
	highlights.Include = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights.Define = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights.Macro = { fg = c.metadata }
	highlights.PreCondit = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }

	-- Types
	highlights.Type = { fg = c.type }
	highlights.StorageClass = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights.Structure = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights.Typedef = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }

	-- Special
	highlights.Special = { fg = c.fg }
	highlights.SpecialChar = { fg = c.escape }
	highlights.Tag = { fg = c.tag }
	highlights.Delimiter = { fg = c.punctuation }
	highlights.SpecialComment = { fg = c.doc_comment }
	highlights.Debug = { fg = c.warning }

	-- Other
	highlights.Underlined = { fg = c.hyperlink }
	highlights.Ignore = { fg = c.fg_dimmer }
	highlights.Error = { fg = c.error }
	highlights.Todo = { fg = c.todo, bold = true }

	return highlights
end

return M
