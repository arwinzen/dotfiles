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
      {
        name = "Notes",
        path = "~/Obsidian/Notes",
      },
      {
        name = "Xsolla",
        path = "~/Obsidian/Xsolla"
      }
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
