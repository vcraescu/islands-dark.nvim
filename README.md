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
- 🔌 **Plugin Support**: Optimized for popular plugins (blink-cmp, Copilot, copilot.lua, fzf-lua, nvim-tree, gitsigns)
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
      Function = { fg = colors.func, bold = true },
      Comment = { fg = colors.comment, italic = true },
    }
  end,

  -- OR use on_highlights to modify highlights in-place (Method 2)
  on_highlights = function(highlights, colors)
    -- Modify highlights table directly
    highlights.Function = { fg = colors.func, bold = true }
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

Islands Dark supports two callback methods for customization:

#### Method 1: `overrides` (Recommended)

Return a table of highlight group overrides:

```lua
require("islands-dark").setup({
  overrides = function(colors)
    return {
      Function = { fg = colors.func, bold = true },
      Comment = { fg = colors.comment, italic = true },
      Visual = { bg = colors.visual },
    }
  end,
})
```

#### Method 2: `on_highlights`

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
- Use `on_highlights` for complex modifications with conditional logic

## 🔌 Plugin Support

Islands Dark includes optimized highlighting for popular Neovim plugins. Plugin integrations are modular and
automatically loaded:

### Completion

- **[blink.cmp](https://github.com/Saghen/blink.cmp)**: Complete menu, matching, and kind highlights

### AI Assistance

- **[GitHub Copilot](https://github.com/github/copilot.vim)**: Inline suggestions and cycling annotations
- **[copilot.lua](https://github.com/zbirenbaum/copilot.lua)**: Inline suggestions and panel annotations

### File Explorers

- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)**: Icon colors, folder highlighting, git status
  indicators

### Fuzzy Finders

- **[fzf-lua](https://github.com/ibhagwan/fzf-lua)**: Search results, prompts, and preview window colors

### Git Integration

- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**: Signs, line backgrounds, inline changes, deleted
  virtual lines, and blame highlights

To show GitSigns line and inline backgrounds, enable them in your GitSigns configuration:

```lua
require("gitsigns").setup({
  linehl = true,
  word_diff = true,
})
```

### Syntax & LSP

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Full support for all language parsers with
  granular captures
- **LSP Semantic Tokens**: Priority highlighting (125) over Treesitter (100) for accurate semantics
- **Diagnostics**: Error, warning, info, and hint highlights with underlines

### Color Palette

Colors are separated into two modules:

- `lua/islands-dark/palette.lua`: Raw hex values, grouped by hue, with source comments. Numbers are stable identifiers,
  not brightness ranks.
- `lua/islands-dark/colors.lua`: Semantic roles used by highlight modules and configuration callbacks.

Use semantic names when you define highlights:

- **Backgrounds**: `background`, `background_gutter`, `background_surface`, `background_highlight`
- **Foregrounds**: `foreground`, `foreground_muted`, `foreground_dim`, `foreground_bright`, `foreground_inlay`
- **Syntax**: `keyword`, `string`, `number`, `func`, `func_builtin`, `func_call`, `type`, `comment`
- **UI**: `cursorline`, `line_number`, `border`, `visual`, `directory`
- **Diagnostics**: `error`, `warning`, `info`, `hint`, `ok`

Git signs, native diff, and file-tree Git markers share `colors.changes`:

| Change  | Sign foreground     | Line background          | Inline background        | Inline foreground        |
| ------- | ------------------- | ------------------------ | ------------------------ | ------------------------ |
| Added   | `changes.add.fg`    | `changes.add.line_bg`    | `changes.add.text_bg`    | `changes.add.text_fg`    |
| Changed | `changes.change.fg` | `changes.change.line_bg` | `changes.change.text_bg` | `changes.change.text_fg` |
| Deleted | `changes.delete.fg` | `changes.delete.line_bg` | `changes.delete.text_bg` | `changes.delete.text_fg` |

Edit the shared definitions in `colors.lua` to change these colors together. Git and diff use the supplied backgrounds:

| Change  | Line background | Inline background |
| ------- | --------------- | ----------------- |
| Added   | `#1F2B26`       | `#294436`         |
| Changed | `#25323E`       | `#385570`         |
| Deleted | `#2B2322`       | `#45302B`         |

All inline regions use the light `foreground_bright` color. Explicit `text_fg` values prevent inline text from
inheriting dark syntax colors.

GitSigns buffer word-diff groups (`GitSignsAddLnInline`, `GitSignsChangeLnInline`, and `GitSignsDeleteLnInline`) use the
changed-text blue because they mark edits inside changed lines. Added and deleted inline previews keep their respective
green and red backgrounds.

`DiffText` highlights changed text inside a changed line. Neovim 0.12+ also uses `DiffTextAdd` for inserted text inside
changed lines with `diffopt` set to `inline:char` or `inline:word`. `DiffTextAdd` links to `DiffText`, so insertions
inside changed lines use the changed-text blue, not the added-text green. Older versions ignore `DiffTextAdd`. On older
versions, `DiffText` can include unchanged text between the first and last differences.

**Breaking change:** Numbered palette fields, `base*`, `text*`, `git_add`, `git_change`, `git_delete`, and `diff_*` are
no longer exported by `colors.lua`. Update callbacks to use semantic names and `changes`. Raw numbered colors are
available only through `require("islands-dark.palette")`.

The original `IslandsDark.icls` is not included. Source comments were checked against `test/IslandsDark.xml` where
possible. Existing values that are absent from that export are preserved and marked as unverified in `palette.lua`. The
six supplied Git and diff backgrounds are marked as user-specified colors, not theme-export values.

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

Run the headless checks with Neovim 0.9+:

```bash
nvim --headless -u NONE -l test/check_theme.lua
```

Open the syntax test files in Neovim with Islands Dark applied to check the visual result.

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
