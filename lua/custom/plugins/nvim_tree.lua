return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    enabled = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    view = {
      width = {
        padding = 3, -- Adjust this value to change the default tab width
        min = 20,
      },
      -- Other view options...
    },
    keys = {
      { '<leader>nt', '<cmd>Neotree toggle<cr>', desc = 'Toggle Neo-tree' },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false, -- This line ensures hidden files are shown
          hide_gitignored = false,
          hide_by_name = {
            -- Add any specific files you want to hide here
            -- '.git',
            -- '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = {},
        },
      },
    },
  },
}
