-- Neovim plugin for GitHub Copilot
return {
  'github/copilot.vim',
  config = function()
    vim.g.copilot_filetypes = {
      ['*'] = false,
      elixir = true,
    }
  end,
}
