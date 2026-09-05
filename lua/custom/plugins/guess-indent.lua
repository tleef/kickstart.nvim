-- Detect tabstop and shiftwidth automatically
local gh = require('custom.pack').gh

vim.pack.add { gh 'NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}
