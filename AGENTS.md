# Agents Guide for kickstart.nvim

## Commands
- **Format**: `:lua require('conform').format()` or `<leader>f` (uses stylua for Lua, ruff for Python, jq for JSON)
- **Lint**: Formatters run on save automatically (see conform.nvim config)
- **Check health**: `:checkhealth` - diagnose configuration issues
- **Plugin management**: `:help vim.pack` - update with `:lua vim.pack.update()`
- **LSP**: Servers configured via nvim-lspconfig; binaries must be installed manually (active: gopls, ruff, ty, rust_analyzer, lua_ls; pyright is commented out)
- **Check config**: `nvim --headless -c "quit" 2>&1` - always run after editing config to check for errors

## Architecture
- **Single-file config**: init.lua contains entire configuration (intentionally monolithic for learning)
- **Plugin structure**: Custom plugins in `lua/custom/plugins/`, kickstart examples in `lua/kickstart/plugins/`
- **Plugin manager**: built-in `vim.pack` (no lazy.nvim, no mason.nvim)
- **LSP**: nvim-lspconfig directly (no mason); install language server binaries via system package manager
- **Formatting**: conform.nvim handles all formatting (auto-format on save)
- **Completion**: blink.cmp (upstream default) with LuaSnip for snippets

## Upstream Alignment
- **neo-tree**: Must NOT be lazy-loaded - upstream requires eager loading for netrw hijacking
- **blink.cmp**: Keep as default completion engine per upstream (do not remove or replace with nvim-cmp)

## Code Style (Lua)
- **Indentation**: 2 spaces (see .stylua.toml)
- **Line width**: 160 characters max
- **Quotes**: Auto-prefer single quotes
- **Function calls**: No parentheses when possible (stylua: `call_parentheses = "None"`)
- **Simple statements**: Collapsed to one line (stylua: `collapse_simple_statement = "Always"`)
- **Comments**: Use `--` for single line, `--[[  ]]` for blocks
- **Conventions**: Follow existing patterns in init.lua; use `vim.keymap.set()` for keymaps, `vim.opt` for options
- **ASCII only**: Never use nerd fonts and emojis, only ASCII
