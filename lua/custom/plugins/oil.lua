-- Edit your filesystem like a buffer
local gh = require('custom.pack').gh

vim.pack.add { gh 'stevearc/oil.nvim' }
require('oil').setup {
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  },
  keymaps = {
    ['<leader>ff'] = {
      function()
        require('telescope.builtin').find_files {
          cwd = require('oil').get_current_dir(),
        }
      end,
      mode = 'n',
      nowait = true,
      desc = 'Find files in the current directory',
    },
  },
}
