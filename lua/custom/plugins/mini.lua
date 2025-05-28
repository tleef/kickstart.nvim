-- Collection of various small independent plugins/modules
return {
  'echasnovski/mini.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    local gen_spec = require('mini.ai').gen_spec
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup {
      n_lines = 500,
      custom_textobjects = {
        -- Function definition (needs treesitter queries with these captures)
        F = gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
      },
    }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Go forward/backward with square brackets
    require('mini.bracketed').setup()

    -- Navigate and manipulate file system
    require('mini.files').setup {
      windows = {
        preview = true,
        width_preview = 80,
      },
    }

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
