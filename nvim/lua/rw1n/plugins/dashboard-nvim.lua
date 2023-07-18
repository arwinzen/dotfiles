local db = require('dashboard')

db.setup({
  theme = 'doom',
  config = {
    header = {
        '',
        '',        
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
    }, --your header
    center = {
      { icon = '  ', desc = 'New file', action = 'enew' },
      { icon = '  ', key = 'SPC f', desc = 'Find file', action = 'Telescope find_files' },
      { icon = '󰈙  ', key = 'SPC h', desc = 'Recent files', action = 'Telescope oldfiles' },
      { icon = '󰈭  ', key = 'SPC g', desc = 'Find Word', action = 'Telescope live_grep' },
    },
    footer = {}  --your footer
  }
})
