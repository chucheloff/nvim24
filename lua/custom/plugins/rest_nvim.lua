return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    dependencies = { 'luarocks.nvim', 'nvim-neotest/nvim-nio' },
    config = function()
      require('rest-nvim').setup()
    end,
  },
}
