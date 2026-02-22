-- LSP semantic token highlights for Islands Dark theme

local M = {}

--- Setup LSP semantic token highlights
--- @param c table Color palette
--- @return table Highlight groups for LSP semantic tokens
function M.setup(c)
	local highlights = {}

	-- Namespaces and modules
	highlights["@lsp.type.namespace"] = { link = "@type" }
	highlights["@lsp.type.module"] = { link = "@lsp.type.namespace" }

	-- Types
	highlights["@lsp.type.type"] = { link = "@type" }
	highlights["@lsp.type.class"] = { link = "@lsp.type.type" }
	highlights["@lsp.type.enum"] = { link = "@lsp.type.type" }
	highlights["@lsp.type.interface"] = { link = "@lsp.type.type" }
	highlights["@lsp.type.struct"] = { link = "@lsp.type.type" }
	highlights["@lsp.type.typeParameter"] = { link = "@lsp.type.type" }

	-- Functions and methods
	highlights["@lsp.type.function"] = { link = "@function" }
	highlights["@lsp.type.method"] = { link = "@lsp.type.function" }
	highlights["@lsp.type.macro"] = { link = "Macro" }
	highlights["@lsp.type.decorator"] = { link = "PreProc" }

	-- Variables
	highlights["@lsp.type.variable"] = { link = "@variable" }
	highlights["@lsp.type.parameter"] = { link = "@lsp.type.variable" }
	highlights["@lsp.type.property"] = { link = "@property" }
	highlights["@lsp.type.field"] = { link = "@variable.member" }
	highlights["@lsp.type.enumMember"] = { fg = c.enum_member }

	-- Keywords
	highlights["@lsp.type.keyword"] = { link = "@keyword" }

	-- Comments
	highlights["@lsp.type.comment"] = { link = "@comment" }

	-- Modifiers
	highlights["@lsp.mod.constant"] = { link = "@constant" }
	highlights["@lsp.mod.readonly"] = { link = "@lsp.mod.constant" }
	highlights["@lsp.mod.static"] = { link = "@lsp.type.function" }
	highlights["@lsp.mod.deprecated"] = { fg = c.deprecated }
	highlights["@lsp.mod.defaultLibrary"] = { link = "@lsp.mod.keyword" }

	-- Specific language semantic tokens
	highlights["@lsp.typemod.variable.readonly"] = { link = "@lsp.mod.constant" }
	highlights["@lsp.typemod.variable.constant"] = { link = "@lsp.mod.constant" }
	highlights["@lsp.typemod.variable.defaultLibrary"] = { link = "@type.builtin" }
	highlights["@lsp.typemod.function.defaultLibrary"] = { link = "@keyword" }
	highlights["@lsp.typemod.method.defaultLibrary"] = { link = "@lsp.type.method" }
	highlights["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" }
	highlights["@lsp.typemod.type.definition"] = { link = "@type.definition" }
	highlights["@lsp.typemod.class.declaration"] = { link = "@lsp.typemod.type.definition" }
	highlights["@lsp.typemod.interface.declaration"] = { link = "@lsp.typemod.type.definition" }

	-- Go-specific LSP semantic tokens
	highlights["@lsp.type.namespace.go"] = { fg = c.metadata }

	--- Typescript/JS-specific LSP semantic tokens
	highlights["@lsp.typemod.variable.readonly.typescript"] = { link = "@constant.typescript" }
	highlights["@lsp.typemod.variable.readonly.typescriptreact"] = { link = "@constant.typescript" }
	highlights["@lsp.typemod.variable.readonly.javascript"] = { link = "@constant.typescript" }
	highlights["@lsp.mod.readonly.typescript"] = {}
	highlights["@lsp.mod.readonly.typescriptreact"] = {}
	highlights["@lsp.mod.readonly.javascript"] = {}
	highlights["@lsp.type.property.javascript"] = {}
	highlights["@tag.builtin.tsx"] = { link = "@tag" }
	highlights["@tag.delimiter.tsx"] = { link = "@tag" }

	-- Proto
	highlights["@lsp.type.property.proto"] = { link = "@property.proto" }
	highlights["@lsp.type.struct.proto"] = { link = "@type.proto" }
	highlights["@lsp.type.enum.proto"] = { link = "@type.proto" }
	highlights["@lsp.type.namespace.proto"] = { link = "@type.proto" }

	return highlights
end

return M
