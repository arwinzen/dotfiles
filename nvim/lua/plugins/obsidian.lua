return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      -- {
      --   name = "Notes",
      --   path = "~/Obsidian/Notes",
      -- },
      {
        name = "rw1n",
        path = "~/Obsidian/rw1n"
      }
    },
     -- Optional, for templates (see below).
    templates = {
      folder = "~/Obsidian/rw1n/Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
    -- daily notes
     daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "daily-notes/",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y.%m.%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, default tags to add to each new daily note created.
      default_tags = { "daily-notes" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "~/Obsidian/rw1n/templates/DailyNoteTemplate.md"
    },
    mappings = {
      ["<leader>od"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
      ["<leader>zo"] = {
        action = function()
          vim.cmd("ObsidianQuickSwitch Home.md")
        end,
        opts = { noremap = true, silent = true},
      }
    },
    note_frontmatter_func = function(note)
      -- This is equivalent to the default frontmatter function.
      local out = {
        id = note.id,
        aliases = note.aliases,
        tags = note.tags,
        area = "",
        project = ""
      }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- We're making sure that these fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
  },
}
