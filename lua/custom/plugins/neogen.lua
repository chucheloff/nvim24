return {
  'danymat/neogen',
  enabled = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  languages = {
    python = {
      template = {
        annotation_convention = 'google_docstring',
      },
    },
  },
  config = function()
    require('neogen').setup {
      snippet_engine = 'luasnip',
    }
  end,
}
