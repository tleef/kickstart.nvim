-- autopairs
-- https://github.com/windwp/nvim-autopairs
local gh = require('custom.pack').gh

vim.pack.add { gh 'windwp/nvim-autopairs' }
require('nvim-autopairs').setup {}
