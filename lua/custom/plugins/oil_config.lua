return {
  {
    'stevearc/oil.nvim',
    enabled = false,
    -- this is mapping a "-" key to open oil from a file
    keys = {
      {
        '-',
        function()
          require('oil').open()
        end,
        mode = { 'n' },
        desc = 'Open parent dir',
      },
    },
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      use_default_keymaps = false,
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        -- You cant use Ctrl + s cause its a leader bind for tmux and it getrs intersected before it get through to nvim inside a tmux
        -- ['<C-s>'] = 'actions.select_vsplit',
        ['<C-w>'] = 'actions.select_split',
        -- ['<leader>st'] = 'actions.select_tab',
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = 'actions.close',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        -- ['`'] = 'actions.cd',
        -- ['~'] = 'actions.tcd',
        -- ['gs'] = 'actions.change_sort',
        -- ["gx"] = "actions.open_external",
        -- ["g."] = "actions.toggle_hidden",
        -- ["g\\"] = "actions.toggle_trash",
      },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function(_, opts)
      require('oil').setup(opts)
    end,
  },
}
