return {
  'echasnovski/mini.files',
  lazy = false,
  opts = {
    windows = {
      preview = false,
      width_focus = 30,
      width_preview = 30,
    },
    options = {
      -- Whether to use for editing directories
      -- Disabled by default in LazyVim because neo-tree is used for that
      use_as_default_explorer = true,
    },
    mappings = {
      go_in = '<CR>',
      go_in_plus = 'l',
      go_out = '-',
      go_out_plus = 'h',
    },
  },
  keys = {
    {
      '-',
      function()
        require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = 'Open mini.files (Directory of Current File)',
    },
    {
      '_',
      function()
        require('mini.files').open(vim.uv.cwd(), true)
      end,
      desc = 'Open mini.files (cwd)',
    },
  },
  config = function(_, opts)
    require('mini.files').setup(opts)

    local show_dotfiles = true
    local filter_show = function(fs_entry)
      return true
    end
    local filter_hide = function(fs_entry)
      return not vim.startswith(fs_entry.name, '.')
    end

    local toggle_dotfiles = function()
      show_dotfiles = not show_dotfiles
      local new_filter = show_dotfiles and filter_show or filter_hide
      require('mini.files').refresh { content = { filter = new_filter } }
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        -- Tweak left-hand side of mapping to your liking
        vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id, desc = 'Toggle Hidden Files' })
      end,
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesActionRename',
      callback = function(event)
        vim.lsp.on_rename(event.data.from, event.data.to)
      end,
    })
  end,
}
