return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    -- Setup neo-tree
    require('neo-tree').setup {
      -- Your configuration here
    }

    -- Automatically open neo-tree on startup
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv()[1]) == 1 then
          require('neo-tree.command').execute { action = 'show' } -- or "focus"
        end
      end,
    })
  end,
}
