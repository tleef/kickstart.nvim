-- [[ Configure Treesitter ]]
--  Used to highlight, edit, and navigate code
--
--  See `:help nvim-treesitter-intro`
local gh = require('custom.pack').gh

-- NOTE: You can also specify a branch or a specific commit.
--  The `:TSUpdate` step after install/update runs from the PackChanged hook in `custom.pack`.
vim.pack.add {
  { src = gh 'nvim-treesitter/nvim-treesitter', version = 'main' },
  -- Provides the `textobjects` queries used by the mini.ai `F` textobject (see `custom.plugins.mini`)
  { src = gh 'nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
}

-- Ensure these parsers are installed. Any other language with an available
-- parser is installed automatically the first time a file of that type is opened.
local parsers = {
  'bash',
  'c',
  'clojure',
  'css',
  'diff',
  'dockerfile',
  'eex',
  'elixir',
  'erlang',
  'heex',
  'html',
  'javascript',
  'json',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'python',
  'query',
  'svelte',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
}
require('nvim-treesitter').install(parsers)

---@param buf integer
---@param language string
local function treesitter_try_attach(buf, language)
  -- Check if a parser exists and load it
  if not vim.treesitter.language.add(language) then return end
  -- Enable syntax highlighting and other treesitter features
  vim.treesitter.start(buf, language)

  -- Enable treesitter based folds
  -- For more info on folds see `:help folds`
  -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  -- vim.wo.foldmethod = 'expr'

  -- Check if treesitter indentation is available for this language, and if so enable it
  -- in case there is no indent query, the indentexpr will fallback to the vim's built in one
  local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil

  -- Enable treesitter based indentation
  if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
end

local available_parsers = require('nvim-treesitter').get_available()
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('kickstart-treesitter-attach', { clear = true }),
  callback = function(args)
    local buf, filetype = args.buf, args.match

    local language = vim.treesitter.language.get_lang(filetype)
    if not language then return end

    local installed_parsers = require('nvim-treesitter').get_installed 'parsers'

    if vim.tbl_contains(installed_parsers, language) then
      -- Enable the parser if it is already installed
      treesitter_try_attach(buf, language)
    elseif vim.tbl_contains(available_parsers, language) then
      -- If a parser is available in `nvim-treesitter`, auto-install it and enable it after the installation is done
      require('nvim-treesitter').install(language):await(function() treesitter_try_attach(buf, language) end)
    else
      -- Try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
      treesitter_try_attach(buf, language)
    end
  end,
})
