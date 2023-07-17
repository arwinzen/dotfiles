local db = require('dashboard')

  db.setup({
    config = {
      week_header = {
       enable = false,
      },
      packages = { enable = false },
      project = { enable = false },
    },
  })
