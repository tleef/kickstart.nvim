-- Neovim plugin for GitHub Copilot
return {
  'github/copilot.vim',
  version = '1.41.0',
  config = function()
    vim.g.copilot_filetypes = {
      ['*'] = false,
      elixir = true,
    }
  end,
}
