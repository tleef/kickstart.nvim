-- Each file in this directory installs and configures one plugin with `vim.pack`.
--
-- Files are required explicitly, in order, because `vim.pack` loads plugins
-- eagerly and some depend on others already being set up:
--   - tokyonight is loaded early so other plugins pick up its highlights
--   - mini (mini.icons) is loaded before telescope and oil, which use its icons
--   - lspconfig sets up mason before conform and blink rely on installed tools
require 'custom.plugins.guess-indent'
require 'custom.plugins.fugitive'
require 'custom.plugins.abolish'
require 'custom.plugins.gitsigns'
require 'custom.plugins.which-key'
require 'custom.plugins.tokyonight'
require 'custom.plugins.todo-comments'
require 'custom.plugins.mini'
require 'custom.plugins.telescope'
require 'custom.plugins.lspconfig'
require 'custom.plugins.conform'
require 'custom.plugins.blink'
require 'custom.plugins.nvim-treesitter'
require 'custom.plugins.autopairs'
require 'custom.plugins.oil'
