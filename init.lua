-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

require 'custom.options'

require 'custom.keymaps'

require 'custom.autocommands'

require 'custom.pack'

require 'custom.plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
