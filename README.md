# islands-dark.nvim

A faithful port of JetBrains IntelliJ IDEA Islands Dark theme for Neovim.

<div align="center">

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Neovim](https://img.shields.io/badge/Neovim-0.9+-green.svg)

</div>

## ✨ Features

- 🎨 **Faithful Port**: Accurately reproduces IntelliJ IDEA Islands Dark colors
- 🌲 **Treesitter Support**: Full support for Treesitter syntax highlighting
- 🔍 **LSP Integration**: Semantic tokens and diagnostics highlighting
- 🔌 **Plugin Support**: Optimized for popular plugins (blink-cmp, fzf-lua, nvim-tree, gitsigns)
- ⚙️ **Customizable**: Configure transparent backgrounds, styles, and color overrides
- 🎯 **Semantic Priority**: LSP semantic tokens take precedence over Treesitter for accurate highlighting
- 🖥️ **Terminal Colors**: 16 ANSI colors matching the theme

## 📸 Screenshots

> **Note**: Screenshots will be added soon. The theme faithfully reproduces the IntelliJ IDEA Islands Dark color scheme
> with all its distinctive colors and semantic highlighting.

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "vcraescu/islands-dark.nvim",
  priority = 1000,  -- Load before other plugins
  config = function()
    require("islands-dark").setup({
      -- Your configuration here (optional)
    })
    vim.cmd("colorscheme islands-dark")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "vcraescu/islands-dark.nvim",
  config = function()
    require("islands-dark").setup({
      -- Your configuration here (optional)
    })
    vim.cmd("colorscheme islands-dark")
  end
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'vcraescu/islands-dark.nvim'
```

Then in your `init.vim` or `init.lua`:

```lua
require("islands-dark").setup({
  -- Your configuration here (optional)
})
vim.cmd("colorscheme islands-dark")
```

## 🚀 Usage

### Basic Setup

```lua
-- Load with default settings
require("islands-dark").load()

-- Or use :colorscheme command
vim.cmd("colorscheme islands-dark")
```

### Advanced Configuration

```lua
require("islands-dark").setup({
  -- Transparent background (default: false)
  transparent = false,

  -- Terminal colors (default: true)
  terminal_colors = true,

  -- Style customization
  styles = {
    comments = { italic = true },
    keywords = { bold = false },
    functions = { italic = false },
    strings = { italic = false },
    variables = { italic = false },
  },

  -- Override callback - returns table of highlight overrides (Method 1)
  overrides = function(colors)
    return {
      Function = { fg = colors.blue4, bold = true },
      Comment = { fg = colors.comment, italic = true },
    }
  end,

  -- OR use on_colors to modify colors before highlights are created (Method 2)
  on_colors = function(colors)
    -- Modify colors directly before any highlights are generated
    colors.keyword = "#FF0000"  -- Change keyword color
    colors.bg = "#1a1a1a"       -- Darker background
  end,

  -- OR use on_highlights to modify highlights in-place (Method 3)
  on_highlights = function(highlights, colors)
    -- Modify highlights table directly
    highlights.Function = { fg = colors.blue4, bold = true }
    highlights.Comment = { fg = colors.comment, italic = true }
  end,
})

-- Apply the colorscheme
require("islands-dark").load()
```

## 🔧 Configuration Options

### Transparent Background

Make the background transparent to match your terminal:

```lua
require("islands-dark").setup({
  transparent = true,
})
```

### Style Customization

Customize styles for different syntax elements:

```lua
require("islands-dark").setup({
  styles = {
    comments = { italic = true },           -- Italic comments
    keywords = { bold = true },             -- Bold keywords
    functions = { italic = true },          -- Italic functions
    strings = { italic = false },           -- No italic strings
    variables = { italic = false },         -- No italic variables
  },
})
```

Available style properties:

- `italic` - Apply italic style
- `bold` - Apply bold style
- `underline` - Apply underline
- `undercurl` - Apply undercurl (for diagnostics)
- `strikethrough` - Apply strikethrough

### Customization Methods

Islands Dark supports three different callback methods for customization:

#### Method 1: `overrides` (Recommended)

Return a table of highlight group overrides:

```lua
require("islands-dark").setup({
  overrides = function(colors)
    return {
      Function = { fg = colors.func, bold = true },
      Comment = { fg = colors.comment, italic = true },
      Visual = { bg = colors.selection },
    }
  end,
})
```

#### Method 2: `on_colors`

Modify the color palette before highlights are created:

```lua
require("islands-dark").setup({
  on_colors = function(colors)
    -- Modify colors directly
    colors.bg = "#1a1a1a"        -- Darker background
    colors.keyword = "#ff6b9d"    -- Pink keywords
    colors.string = "#98c379"     -- Different green for strings
  end,
})
```

**Note**: `on_colors` modifies the base palette, affecting ALL highlight groups that use those colors.

#### Method 3: `on_highlights`

Modify highlights table in-place:

```lua
require("islands-dark").setup({
  on_highlights = function(highlights, colors)
    -- Modify highlights directly
    highlights.Function = {
      fg = colors.func,
      bold = true,
      italic = true,
    }

    highlights.Comment = {
      fg = colors.comment,
      italic = true,
    }
  end,
})
```

**Choose one method** based on your needs:
- Use `overrides` for simple highlight customizations (cleanest API)
- Use `on_colors` to change base colors that affect multiple highlights
- Use `on_highlights` for complex modifications with conditional logic

## 🔌 Plugin Support

Islands Dark includes optimized highlighting for popular Neovim plugins. Plugin integrations are modular and automatically loaded:

### Completion

- **[blink.cmp](https://github.com/Saghen/blink.cmp)**: Complete menu, matching, and kind highlights

### File Explorers

- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)**: Icon colors, folder highlighting, git status indicators

### Fuzzy Finders

- **[fzf-lua](https://github.com/ibhagwan/fzf-lua)**: Search results, prompts, and preview window colors

### Git Integration

- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Add/change/delete line indicators, blame highlights

### Syntax & LSP

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Full support for all language parsers with granular captures
- **LSP Semantic Tokens**: Priority highlighting (125) over Treesitter (100) for accurate semantics
- **Diagnostics**: Error, warning, info, and hint highlights with underlines

### Color Palette

The theme uses an extended color palette including:

- **Granular function colors**: `func_builtin` (built-ins), `func_call` (calls), `method` (methods)
- **Type colors**: `type_builtin` (built-in types), `type` (user-defined types)
- **Semantic colors**: `keyword`, `string`, `number`, `boolean`, `operator`
- **VCS colors**: `vcs_added`, `vcs_modified`, `vcs_removed`
- **UI colors**: `cursor_line`, `line_number`, `border`, `visual`, `selection`

All colors are sourced from the original IntelliJ IDEA Islands Dark theme (`IslandsDark.icls`).

## 🌲 Treesitter Support

Islands Dark fully supports Neovim's Treesitter with all standard captures and language-specific overrides:

```lua
-- Enable Treesitter (if not already enabled)
require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
})

-- Load Islands Dark
require("islands-dark").load()
```

## 🎯 LSP Semantic Tokens

LSP semantic tokens are given priority (125) over Treesitter highlighting for more accurate code semantics:

- Functions, methods, and parameters
- Variables with different scopes (local, global, parameter)
- Types and interfaces
- Constants and enum members
- Namespaces and modules

## 🖥️ Terminal Colors

Islands Dark sets 16 ANSI terminal colors to match the theme:

```lua
-- Disable terminal colors if needed
require("islands-dark").setup({
  terminal_colors = false,
})
```

## 🤝 Integration with FZF

For consistent colors in shell tools like FZF, add this to your shell configuration:

```bash
# ~/.zshrc or ~/.bashrc
export FZF_DEFAULT_OPTS=" \
--color=fg:#BCBEC4,bg:#191A1C,hl:#56A8F5 \
--color=fg+:#DFE1E5,bg+:#2B2D30,hl+:#56A8F5 \
--color=info:#B3AE60,prompt:#E0BB65,pointer:#C77DBB \
--color=marker:#6AAB73,spinner:#2AACB8,header:#16BAAC \
--color=border:#393B40,label:#BCBEC4,query:#DFE1E5 \
--color=gutter:#191A1C,selected-bg:#2B2D30"
```

For ripgrep colors to match search highlighting:

```bash
# ~/.zshrc or ~/.bashrc
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# ~/.ripgreprc
--colors=match:fg:166
--colors=match:style:bold
```

## 📚 Documentation

For more detailed documentation, see:

```vim
:help islands-dark
```

Or view the help file: [doc/islands-dark.txt](doc/islands-dark.txt)

## 🧪 Testing

Test files are included to verify syntax highlighting across multiple languages:

- `test/test.lua` - Lua syntax
- `test/test.go` - Go syntax
- `test/test.ts` - TypeScript/TSX syntax
- `test/test.sh` - Bash syntax
- `test/test.yaml` - YAML syntax
- `test/test.json` - JSON syntax
- `test/test.md` - Markdown syntax

Open these files in Neovim with Islands Dark applied to verify the theme works correctly.

## 🐛 Troubleshooting

### Colors Don't Look Right

Make sure your terminal supports true color (24-bit):

```lua
-- Add to your init.lua
vim.opt.termguicolors = true
```

### Treesitter Colors Not Working

Ensure Treesitter is properly installed and enabled:

```lua
require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "javascript", "typescript", "go", "rust" },
  highlight = { enable = true },
})
```

### LSP Semantic Tokens Not Working

Make sure your LSP server supports semantic tokens. Most modern LSP servers do, but some require configuration.

## 📝 License

MIT License - see [LICENSE](LICENSE) for details

Made with ❤️ for Neovim

</div>
