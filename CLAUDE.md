# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a comprehensive Neovim configuration written in Lua, organized into modular components for better maintainability. The configuration uses Packer as the plugin manager and focuses on providing a full IDE-like experience with LSP support, debugging, testing, and advanced UI features.

## Plugin Management

- **Plugin Manager**: Packer (`wbthomason/packer.nvim`)
- **Plugin Installation**: Run `:PackerInstall` in Neovim
- **Plugin Updates**: Run `:PackerUpdate` in Neovim
- **Plugin Compilation**: Happens automatically when `plugins.lua` is saved, or manually with `:PackerCompile`

## Architecture

The configuration is organized into logical modules:

### Core Structure
- `init.lua` - Entry point that requires all modules
- `lua/plugins.lua` - Plugin declarations and dependencies
- `lua/remaps/` - Key mappings and leader key configuration
- `lua/code/` - Code-related functionality (LSP, completion, debugging, testing)
- `lua/general/` - General editor functionality (clipboard, movement, indentation)
- `lua/ui/` - UI components and visual enhancements

### Key Modules

**LSP and Completion** (`lua/code/completion/`):
- `lsp.lua` - LSP server configuration for multiple languages (Go, Python, Lua, Java, Docker, YAML, SQL, Markdown)
- `claude.lua` - Claude Code integration with `<leader>cc` keybinding
- Uses `nvim-cmp` for autocompletion with LSP, buffer, path, and cmdline sources

**Language Support**:
- Go: gopls LSP, debugging with delve, testing with neotest-go
- Python: pyright + ruff LSP, black formatting via pylsp, debugging with debugpy, testing with neotest-python
- Java: jdtls LSP with dedicated ftplugin configuration
- Lua: lua_ls with Neovim and Hammerspoon workspace support
- Docker, YAML, SQL, Markdown: respective LSP servers configured

**Testing** (`lua/code/testing/neotest.lua`):
- Uses neotest framework with adapters for Python, Go, and Plenary
- Key mappings: `<leader>tr` (run test), `<leader>tf` (run file tests), `<leader>td` (debug test)

**Debugging** (`lua/code/debug/nvim-dap.lua`):
- nvim-dap with language-specific configurations
- Python: uses dedicated pyenv debugpy installation
- Go: delve integration with remote attach capability
- Key mappings: F5-F12 for debug controls, `<leader>b` for breakpoints

**Telescope Integration** (`lua/ui/telescope.lua`):
- Fuzzy finding with extensive keybindings under `<leader>f*` and `<leader>g*`
- Git integration, LSP symbol search, buffer management

## Key Bindings

**Leader Key**: Space (` `)

**Essential Shortcuts**:
- `<leader>cc` - Toggle Claude Code
- `<leader>ff` - Find files
- `<leader>gs` - Grep string
- `<leader>gf` - Find git files
- `<leader>tr` - Run test
- `<leader>b` - Toggle breakpoint
- `K` - LSP hover
- `gd` - Go to definition
- `<F2>` - Rename symbol
- `<F3>` - Format file (uses black for Python)
- `<F4>` - Show code actions

## Development Workflow

1. **Plugin Changes**: Edit `lua/plugins.lua`, save (auto-compiles), then `:PackerInstall` if needed
2. **LSP Configuration**: Modify enabled servers in `lua/code/completion/lsp.lua`
3. **Testing**: Use neotest keybindings for running and debugging tests
4. **Debugging**: Set breakpoints with `<leader>b`, start debugging with F5
5. **File Navigation**: Use Telescope fuzzy finder with `<leader>ff` or Harpoon for bookmarking

## Special Configurations

- **Python Formatting**: Uses black via pylsp for Python files, standard LSP formatting for others
- **Hammerspoon Support**: Lua LSP configured with Hammerspoon library paths
- **Git Integration**: Fugitive, git-conflict, and blame-line plugins for Git workflow
- **Movement**: Leap for quick navigation, xkbswitch to prevent keyboard layout issues
- **UI**: Catppuccin theme, Galaxyline status bar, Rainbow delimiters, Windows animation

## Notes

- Configuration automatically recompiles Packer when `plugins.lua` is modified
- LSP servers are configured in `enabled_servers` table for easy management
- Debugging requires separate Python environment setup for debugpy
- Java development uses separate ftplugin configuration for jdtls