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
- 🔌 **Plugin Support**: Optimized for popular plugins (nvim-cmp, fzf-lua, nvim-tree, gitsigns, and more)
- ⚙️ **Customizable**: Configure transparent backgrounds, styles, and color overrides
- 🎯 **Semantic Priority**: LSP semantic tokens take precedence over Treesitter for accurate highlighting
- 🖥️ **Terminal Colors**: 16 ANSI colors matching the theme

## 📸 Screenshots

> **Note**: Screenshots will be added soon. The theme faithfully reproduces the IntelliJ IDEA Islands Dark color scheme with all its distinctive colors and semantic highlighting.

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

  -- Color overrides
  on_colors = function(colors)
    -- Customize any color from the palette
    colors.keyword = "#FF0000"  -- Example: change keyword color to red
  end,

  -- Highlight overrides
  on_highlights = function(highlights, colors)
    -- Customize specific highlight groups
    highlights.Function = { fg = colors.blue, bold = true }
    highlights.Comment = { fg = colors.comment, italic = true }
  end,
})

-- Apply the colorscheme
require("islands-dark").load()
```

## 🎨 Color Palette

The theme uses the following color palette from IntelliJ IDEA Islands Dark:

### Core Colors

| Color Name | Hex       | Preview                                                      | Usage             |
| ---------- | --------- | ------------------------------------------------------------ | ----------------- |
| Background | `#21252B` | ![test](https://via.placeholder.com/15/21252B/000000?text=+) | Editor background |
| Foreground | `#BAC0C9` | ![](https://via.placeholder.com/15/BAC0C9/000000?text=+)     | Default text      |
| Comment    | `#7A7E85` | ![](https://via.placeholder.com/15/7A7E85/000000?text=+)     | Comments          |
| String     | `#6AAB73` | ![](https://via.placeholder.com/15/6AAB73/000000?text=+)     | String literals   |
| Number     | `#2AACB8` | ![](https://via.placeholder.com/15/2AACB8/000000?text=+)     | Numbers           |
| Keyword    | `#CF8E6D` | ![](https://via.placeholder.com/15/CF8E6D/000000?text=+)     | Keywords          |
| Function   | `#56A8F5` | ![](https://via.placeholder.com/15/56A8F5/000000?text=+)     | Functions         |
| Type       | `#16BAAC` | ![](https://via.placeholder.com/15/16BAAC/000000?text=+)     | Types/Classes     |
| Variable   | `#BAC0C9` | ![](https://via.placeholder.com/15/BAC0C9/000000?text=+)     | Variables         |
| Constant   | `#C77DBB` | ![](https://via.placeholder.com/15/C77DBB/000000?text=+)     | Constants         |

### UI Colors

| Color Name  | Hex       | Preview                                                  | Usage            |
| ----------- | --------- | -------------------------------------------------------- | ---------------- |
| Cursor Line | `#2C313A` | ![](https://via.placeholder.com/15/2C313A/000000?text=+) | Current line     |
| Selection   | `#2F4B5C` | ![](https://via.placeholder.com/15/2F4B5C/000000?text=+) | Visual selection |
| Search      | `#B36100` | ![](https://via.placeholder.com/15/B36100/000000?text=+) | Search matches   |
| Line Number | `#5F6672` | ![](https://via.placeholder.com/15/5F6672/000000?text=+) | Line numbers     |
| Border      | `#3A3F4B` | ![](https://via.placeholder.com/15/3A3F4B/000000?text=+) | Window borders   |

### Diagnostic Colors

| Color Name | Hex       | Preview                                                  | Usage    |
| ---------- | --------- | -------------------------------------------------------- | -------- |
| Error      | `#E65452` | ![](https://via.placeholder.com/15/E65452/000000?text=+) | Errors   |
| Warning    | `#CE9632` | ![](https://via.placeholder.com/15/CE9632/000000?text=+) | Warnings |
| Info       | `#57AAF7` | ![](https://via.placeholder.com/15/57AAF7/000000?text=+) | Info     |
| Hint       | `#8EADB0` | ![](https://via.placeholder.com/15/8EADB0/000000?text=+) | Hints    |

### Git Colors

| Color Name | Hex       | Preview                                                  | Usage         |
| ---------- | --------- | -------------------------------------------------------- | ------------- |
| Add        | `#58A55C` | ![](https://via.placeholder.com/15/58A55C/000000?text=+) | Added lines   |
| Change     | `#57AAF7` | ![](https://via.placeholder.com/15/57AAF7/000000?text=+) | Changed lines |
| Delete     | `#E65452` | ![](https://via.placeholder.com/15/E65452/000000?text=+) | Deleted lines |

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

### Color Overrides

Override any color from the palette:

```lua
require("islands-dark").setup({
  on_colors = function(colors)
    -- Change any color
    colors.bg = "#1a1a1a"        -- Darker background
    colors.keyword = "#ff6b9d"    -- Pink keywords
    colors.string = "#98c379"     -- Different green for strings
  end,
})
```

### Highlight Group Overrides

Customize specific highlight groups:

```lua
require("islands-dark").setup({
  on_highlights = function(highlights, colors)
    -- Customize Function highlighting
    highlights.Function = {
      fg = colors.blue,
      bold = true,
      italic = true,
    }

    -- Customize Comment highlighting
    highlights.Comment = {
      fg = colors.comment,
      italic = true,
    }

    -- Customize Visual selection
    highlights.Visual = {
      bg = colors.selection,
    }
  end,
})
```

## 🔌 Plugin Support

Islands Dark has been optimized for popular Neovim plugins:

### Completion

- **nvim-cmp**: Full support for completion menu, documentation, and kind highlights
- **blink.cmp**: Matching highlight support

### File Explorers

- **nvim-tree**: Complete icon and folder highlighting
- **neo-tree**: Full tree view support

### Fuzzy Finders

- **fzf-lua**: Optimized colors for search results and prompts
- **telescope.nvim**: Full support for all Telescope UI elements

### Git Integration

- **gitsigns**: Added/changed/deleted line indicators
- **diffview.nvim**: Diff view highlighting
- **neogit**: Git status and commit UI

### Status Lines

- **lualine.nvim**: Theme-aware status line
- **feline.nvim**: Custom theme support

### Syntax

- **Treesitter**: Full support for all language parsers
- **LSP Semantic Tokens**: Priority highlighting over Treesitter
- **nvim-treesitter-context**: Sticky context highlighting

### Other

- **which-key.nvim**: Key binding popup
- **indent-blankline.nvim**: Indent guides
- **todo-comments.nvim**: TODO/FIXME/NOTE highlighting
- **trouble.nvim**: Diagnostics list

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

Supported language-specific highlights include:

- Go: Proper highlighting for receivers, type parameters, and function calls
- TypeScript/JavaScript: React components, JSX tags, and ES6+ syntax
- Python: Decorators, comprehensions, and type hints
- Rust: Macros, lifetimes, and trait implementations
- And many more...

## 🎯 LSP Semantic Tokens

LSP semantic tokens are given priority (125) over Treesitter highlighting for more accurate code semantics:

- Functions, methods, and parameters
- Variables with different scopes (local, global, parameter)
- Types and interfaces
- Constants and enum members
- Namespaces and modules
- And more...

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
export FZF_DEFAULT_OPTS="
  --color=fg:#BAC0C9,bg:#21252B,hl:#B36100
  --color=fg+:#BAC0C9,bg+:#2C313A,hl+:#B36100
  --color=info:#57AAF7,prompt:#CF8E6D,pointer:#C77DBB
  --color=marker:#6AAB73,spinner:#16BAAC,header:#7A7E85
"
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

## 🔍 Comparison with IntelliJ

| Feature               | IntelliJ Islands Dark | islands-dark.nvim |
| --------------------- | --------------------- | ----------------- |
| Color Accuracy        | ✅ Original           | ✅ Faithful port  |
| Semantic Highlighting | ✅ Via IntelliJ       | ✅ Via LSP        |
| Treesitter Support    | ❌ N/A                | ✅ Full support   |
| Plugin Ecosystem      | ✅ JetBrains          | ✅ Neovim plugins |
| Customization         | ⚠️ Limited            | ✅ Full control   |
| Performance           | ✅ Fast               | ✅ Fast           |

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

## 🙏 Acknowledgments

- Inspired by the **IntelliJ IDEA Islands Dark** theme by JetBrains
- Color values extracted from IntelliJ IDEA's `islands_dark.xml` theme file
- Built for the Neovim community with ❤️

## 🔗 Related Projects

- [IntelliJ IDEA](https://www.jetbrains.com/idea/) - The original source of the Islands Dark theme
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Treesitter support
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration

---

<div align="center">

**[Website](https://github.com/vcraescu/islands-dark.nvim)** •
**[Report Bug](https://github.com/vcraescu/islands-dark.nvim/issues)** •
**[Request Feature](https://github.com/vcraescu/islands-dark.nvim/issues)**

Made with ❤️ for Neovim

</div>
