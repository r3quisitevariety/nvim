
# nvim config

personal neovim config consisting of notable plugins like mini, snacks, oil, telescope, toggle-term, trouble, flash, conform, and treesitter.

- utilizes [lazy.nvim](https://github.com/folke/lazy.nvim) 
- plugins live in `lua/plugins/` which are auto-imported by lazy.nvim
- configuration for lsp & lazy.nvim's bootstrap lives in `lua/config/` 
- keymaps, autocommands, and options also live in `lua/config/`



try it out by running:
```nix
export NIX_CONFIG="experimental-features = nix-command flakes"
nix run github:r3quisitevariety/nvim
```

or `nix run github:r3quisitevariety/neovim-dots#shell` for an interactive shell in your `$PATH`

alternatively, run `git clone https://github.com/r3quisitevariety/nvim` in `~/.config` (ensuring previous nvim config is backed up). make sure you have all the necessary lsp servers installed.

## Keymaps

an incomprehensive list of keymaps (just the ones i use frequently)\
leader key is space.

### General
| Key | Action |
|---|---|
| `<leader>e` | Oil             |
| `<C-e>`     | snacks' file-tree | 
| `<C-Space>` | Toggle terminal |
| `<leader>w` | Toggle word wrap |
| `1g` ... `9g` | Go to tab 1 ... 9 |
| `q` | Flash jump |

### Search
all of these options utilizes snacks' picker.
| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | List buffers |
| `<leader>fh` | Search nvim docs |

### LSP
| Key | Action |
|---|---|
| `<leader>gd` | Go to symbol definition |
| `<leader>gr` | List symbol references |

note: i also use `grr` (**r**eference), `gra` (**a**ction), and `grn` (re**n**ame); these are already integrated into neovims core. `gd` (highlights definition) is also an honorable mention, though not necessarily lsp-related.

### Git

| Key | Action |
|---|---|
| `<leader>lg` | Open LazyGit |
| `<leader>gg` | Git diff in picker |
| `]h` / `[h` | Next / previous changed hunk |
| `<leader>hp` | Preview changed hunk |
| `<leader>hb` | Blame current line |
| `<leader>hd` | Diff current file |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |

### Gitpad

| Key | Action |
|---|---|
| `<leader>pp` | Toggle project notes |
| `<leader>pb` | Toggle branch notes |
| `<leader>pf` | Toggle notes for the current file |

### Obsidian

| Key | Action |
|---|---|
| `<leader>od` | Open daily notes picker |
| `<leader>dt` | Insert date-time stamp |

### Diagnostics
- `]d` and `[d` to jump between diagnostics
- `<leader>xx` for trouble in current buffer; `<leader>xX` for whole project space

### Misc 
- `:mksession` utilizes mini.sessions to create persistent sessions
- `<leader>sa` for surround; i.e `<leader>saiw(` --> surround add inner word "(' — more info is in `mini.lua`
- `Alt + hjkl` to move text/selected text around 
- `<leader>dr` = reload direnv


## Adding a language

Four things to check (in order):

1. **Binary** — ensure the binaries required for the LSP (i.e rust-analyzer, lua-language-server) are available in your path. Currently my binaries are managed declaratively in my nix dotfiles (separate repo).
2. **LSP** — add a `vim.lsp.config(...)` + `vim.lsp.enable(...)` in `lua/config/lsp.lua`.
3. **Formatter** — add a formatter entry in `lua/plugins/conform.lua`.
4. **Treesitter** — add the parser to `ensure_installed` in `lua/plugins/treesitter.lua`.

## Notes

- Clipboard is synced with the system (`unnamedplus`).
- I format on save :3
