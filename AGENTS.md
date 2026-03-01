# AGENTS.md

Agent instructions for working on the islands-dark.nvim codebase.

## Project Overview

This is a Neovim colorscheme plugin that ports the JetBrains IntelliJ IDEA "Islands Dark" theme.
It's a Lua-based plugin with no build step, no dependencies, and requires Neovim 0.9+.

## Quick Start

```bash
# Install and test locally
nvim -u NONE -c "set rtp+=$(pwd)" -c "colorscheme islands-dark" test/test.lua

# Test with a config file
nvim -u minimal_init.lua test/test.lua
```

## Commands Reference

### Testing
```bash
# Manual testing - open test files to verify syntax highlighting
nvim test/test.lua        # Lua syntax test
nvim test/test.go         # Go syntax test (if exists)

# Test with minimal config
nvim -u NONE -c "set rtp+=$(pwd)" -c "lua require('islands-dark').load()" test/test.lua

# Test configuration options
nvim -c "lua require('islands-dark').setup({transparent=true})" -c "colorscheme islands-dark"
```

### Linting
```bash
# No official linter configured
# Use lua-language-server or luacheck manually if needed
```

### Format
```bash
# No formatter configured
# Manual formatting following the existing code style
```

## Code Style Guidelines

### General Principles
- **Source of truth**: All colors MUST come from `IslandsDark.icls` file - NO custom colors
- **Compatibility**: Target Neovim 0.9+ with `vim.api.nvim_set_hl()`
- **Pure Lua**: No VimL, no external dependencies, standard library only

### File Structure
```
lua/islands-dark/
├── init.lua              # Main entry point, exports setup() and load()
├── config.lua            # Configuration management with defaults
├── colors.lua            # Color palette from IslandsDark.icls
├── util.lua              # Helper functions (load_highlights, apply_overrides, get_style)
└── highlights/
    ├── init.lua          # Highlight loader, applies overrides and on_highlights
    ├── editor.lua        # Editor UI highlights (statusline, cursor, etc.)
    ├── syntax.lua        # Basic syntax highlights
    ├── treesitter.lua    # Treesitter-specific highlights
    ├── lsp.lua           # LSP semantic tokens (priority 125)
    ├── diagnostics.lua   # Diagnostic highlights
    └── integrations/     # Plugin-specific highlights
        ├── init.lua      # Loads all plugin integrations
        ├── blink-cmp.lua # blink.cmp completion highlights
        ├── fzf-lua.lua   # fzf-lua fuzzy finder highlights
        ├── gitsigns.lua  # gitsigns git integration highlights
        └── nvim-tree.lua # nvim-tree file explorer highlights
```

### Naming Conventions

**Variables and functions:**
- `snake_case` for all variables and functions
- Module tables: `local M = {}`
- Descriptive names: `highlight_groups`, not `hg`

**Highlight groups:**
- Follow Neovim conventions: `CamelCase` (e.g., `Function`, `@variable.builtin`)
- Plugin-specific: `PluginNameGroup` (e.g., `NvimTreeFolderName`, `GitSignsAdd`)

**Color variables:**
- Short, semantic names: `fg`, `bg`, `keyword`, `string`, `func`, `error`
- UI elements: `cursor_line`, `line_number`, `border`, `visual`
- VCS: `vcs_added`, `vcs_modified`, `vcs_removed`
- Special: `none = "NONE"` for transparency

### Code Formatting

**Indentation:** Tabs (existing style - DO NOT change to spaces)

**Line length:** No hard limit, but keep reasonable (~120 chars)

**Spacing:**
```lua
-- Good
local function foo(bar, baz)
	if bar == baz then
		return true
	end
end

-- Bad
local function foo(bar,baz)
  if bar==baz then
    return true
  end
end
```

**Tables:**
```lua
-- Inline for short tables
local simple = { fg = c.keyword, bg = c.none }

-- Multi-line for complex tables
local complex = {
	fg = c.fg,
	bg = c.bg,
	bold = true,
}

-- Use vim.tbl_extend for merging styles
vim.tbl_extend("force", { fg = c.func }, { bold = true })
```

### Imports
```lua
-- Standard order:
-- 1. Local module table
local M = {}

-- 2. Requires (at top of function if not module-level)
local config = require("islands-dark.config")
local colors = require("islands-dark.colors")
local util = require("islands-dark.util")

-- 3. Module functions
function M.setup()
	-- ...
end

-- 4. Return statement
return M
```

### Types and Documentation

**CRITICAL:** All functions MUST have LuaDoc annotations with `@param` and `@return` tags.

```lua
--- Load the colorscheme
--- Applies all highlight groups and optionally sets terminal colors
function M.load()
	-- Implementation
end

--- Setup configuration with user overrides
---@param user_config table|nil User configuration options
function M.setup(user_config)
	-- Implementation
end

--- Apply highlight groups to Neovim
---@param groups table Table of highlight groups { group_name = opts }
function M.load_highlights(groups)
	-- Implementation
end

--- Get style options from config
---@param config table User configuration
---@param style_type string Style type (comments, keywords, functions, etc.)
---@return table Style options
function M.get_style(config, style_type)
	-- Implementation
end
```

**Classes:**
```lua
--- @class Config
--- @field transparent boolean Use transparent background
--- @field terminal_colors boolean Set terminal ANSI colors
--- @field styles table Style customization (comments, keywords, etc.)
```

### Error Handling

Minimal error handling - let Neovim handle errors naturally:
```lua
-- Good - simple and clear
local config = require("islands-dark.config").get()

-- Avoid over-engineering
-- Bad - unnecessary pcall for module loading
local ok, config = pcall(require, "islands-dark.config")
if not ok then
	error("Failed to load config")
end
```

Exception: Use `pcall` when calling user-provided functions:
```lua
-- Call user override function safely
local ok, result = pcall(config.overrides, colors)
if ok then
	-- Apply overrides
end
```

## Critical Constraints

### Color Palette Rules
1. **ALL colors must exist in `IslandsDark.icls`** - no exceptions
2. Each color must have a comment indicating its `.icls` source:
   ```lua
   keyword = "#CF8E6D", -- DEFAULT_KEYWORD
   ```
3. When adding new highlight groups, use existing palette colors only
4. If a needed color doesn't exist in `.icls`, find the closest semantic match

### Configuration Callbacks
The theme supports THREE callback styles (all must work):

```lua
-- Style 1: on_colors (modifies colors before applying - NEW)
on_colors = function(colors)
	colors.keyword = "#FF0000"  -- Modify colors directly
	colors.bg1 = "#000000"
end

-- Style 2: overrides (returns table of highlight overrides)
overrides = function(colors)
	return {
		Function = { fg = colors.blue4, bold = true }
	}
end

-- Style 3: on_highlights (modifies highlights in-place)
on_highlights = function(highlights, colors)
	highlights.Function = { fg = colors.blue4, bold = true }
end
```

### Highlight Priorities
Highlight priorities MUST be set in the correct order:
```lua
-- In init.lua load() function:
vim.highlight.priorities.semantic_tokens = 125  -- LSP (highest)
vim.highlight.priorities.treesitter = 100      -- Treesitter (default)
vim.highlight.priorities.syntax = 50           -- Traditional syntax (lowest)
```

This ensures LSP semantic tokens override Treesitter, which overrides traditional syntax.

## Highlight Linking Strategy

### When to Use Links vs Direct Colors

The theme uses a hybrid approach:

**1. Link to syntax groups when they exist:**
```lua
-- In treesitter.lua - Link to base syntax groups (NO style wrapper)
["@function"] = { link = "Function" },
["@keyword"] = { link = "Keyword" },
["@string"] = { link = "String" },
["@comment"] = { link = "Comment" },
```

**2. Use direct colors for Treesitter-specific granular captures:**
```lua
-- These don't exist in traditional syntax, so use direct colors WITH style wrapper
["@function.builtin"] = styles.functions({ fg = c.func_builtin }),
["@function.call"] = styles.functions({ fg = c.func_call }),
["@function.method"] = styles.functions({ fg = c.method }),
```

**3. Link to parent Treesitter captures for inheritance:**
```lua
-- These inherit from their parent Treesitter capture
["@keyword.return"] = { link = "@keyword" },
["@keyword.conditional"] = { link = "@keyword" },
```

### Important: Links and Styles Don't Mix

Never wrap links with style functions - it does nothing:
```lua
-- ❌ WRONG - style wrapper is ignored
["@keyword"] = styles.keywords({ link = "Keyword" })

-- ✅ CORRECT - link without wrapper
["@keyword"] = { link = "Keyword" }

-- ✅ CORRECT - direct color with style wrapper
["@keyword.special"] = styles.keywords({ fg = c.keyword })
```

Why? Because `link` is a special property that tells Neovim to "use all properties from the target group." Any other properties (italic, bold, fg, etc.) are ignored when link is present.

### How User Styles Work

**For linked highlights:**
Styles are applied to the base syntax group in syntax.lua:
```lua
-- In syntax.lua
Function = styles.functions({ fg = c.func })  -- If user sets italic, this gets it

-- In treesitter.lua
["@function"] = { link = "Function" }  -- Automatically inherits italic from Function
```

**For direct color highlights:**
Styles are applied via the wrapper function:
```lua
-- User sets: styles = { functions = { italic = true } }
["@function.builtin"] = styles.functions({ fg = c.func_builtin })
// Result: { fg = "#548AF7", italic = true }
```

## Common Tasks

### Adding a New Highlight Group
1. Determine which module it belongs to (editor, syntax, treesitter, lsp, diagnostics, integrations)
2. Use ONLY colors from the palette in `colors.lua`
3. Decide on linking strategy:
   - If a base syntax group exists → Link to it: `{ link = "Function" }`
   - If it's Treesitter-specific → Use direct color: `styles.functions({ fg = c.func_builtin })`
   - If inheriting from parent capture → Link to parent: `{ link = "@keyword" }`
4. Add the highlight:
   ```lua
   -- With link (no style wrapper)
   highlights.NewGroup = { link = "Function" }
   
   -- OR with direct color (with style wrapper)
   highlights.NewGroup = styles.functions({ fg = c.func, bold = true })
   ```
5. Test with appropriate test file

### Adding Plugin Support
1. Create new file in `lua/islands-dark/highlights/integrations/plugin-name.lua`
2. Follow this template:
   ```lua
   local M = {}
   
   --- Get highlights for plugin-name
   --- @param c theme.Colors Color palette
   --- @return table Highlight groups for plugin-name
   function M.get(c)
   	return {
   		PluginHighlight = { fg = c.text, bg = c.none },
   		-- ... more highlights
   	}
   end
   
   return M
   ```
3. Add to `lua/islands-dark/highlights/integrations/init.lua`:
   ```lua
   local plugin = require("islands-dark.highlights.integrations.plugin-name")
   highlights = vim.tbl_deep_extend("force", highlights, plugin.get(colors))
   ```
4. Document in README.md under "Plugin Support"

### Fixing Color Inconsistencies
1. Check `IslandsDark.icls` for the correct color
2. Update `colors.lua` with the correct hex value and comment
3. Find all usages of the wrong color
4. Update all highlight groups using that color
5. Test across multiple test files

## Testing Checklist

Before submitting changes:
- [ ] Open test files and verify colors look correct
- [ ] Test with `transparent = true` configuration
- [ ] Test `on_colors` callback works (new)
- [ ] Test `overrides` callback works
- [ ] Test `on_highlights` callback works
- [ ] Verify no custom colors were added (all from `.icls`)
- [ ] Check that all new functions have LuaDoc annotations
- [ ] Verify highlight priorities are set (LSP: 125, Treesitter: 100, Syntax: 50)
- [ ] Verify no links are wrapped with style functions
- [ ] Test user styles apply correctly to base groups and granular captures
- [ ] Check that linked groups update when base group changes
- [ ] Test statusbar is visible (not transparent)
- [ ] Verify plugin integrations work (blink-cmp, fzf-lua, nvim-tree, gitsigns)

## Notes

- This plugin has NO external dependencies - keep it that way
- Performance matters - avoid unnecessary allocations or function calls
- Neovim 0.9+ only - use modern APIs like `vim.api.nvim_set_hl()`
- Terminal colors are set via `vim.g.terminal_color_*` variables
- The theme name MUST be "islands-dark" (set via `vim.g.colors_name`)
