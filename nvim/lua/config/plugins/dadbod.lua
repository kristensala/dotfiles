return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.dbs = {
        { name = 'sais@users', url = 'postgres://sais:sais@localhost:5432/Users' },
        { name = 'sais@admission', url = 'postgres://sais:sais@localhost:5437/Admissions' },
        { name = 'sais@exam', url = 'postgres://sais:sais@localhost:5438/Exams' },
        { name = 'sais@settings', url = 'postgres://sais:sais@localhost:5433/Settings' },
        { name = 'sais@messages', url = 'postgres://sais:sais@localhost:5434/Messages' },
    }
  end,
}
