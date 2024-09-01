return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },

        -- Configuration function for Harpoon, executed after the plugin is loaded
        config = function()
            -- Load the Harpoon plugin's main module
            local harpoon = require("harpoon")

            harpoon:setup({})

            -- Set up keybindings for Harpoon's main functionalities
            -- Adds the current file to the Harpoon list
            vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)

            -- Toggles the Harpoon quick menu (shows the list of files)
            -- This block sets up a custom function to display Harpoon files using Telescope
            vim.keymap.set("n", "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            -- Telescope integration for Harpoon
            local conf = require("telescope.config").values

            -- Define a function to create a Telescope picker for Harpoon's file list
            local function toggle_telescope(harpoon_files)
                local file_paths = {}  -- Initialize an empty table to store file paths

                -- Loop through each item in Harpoon's list and add its path to the file_paths table
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                -- Create a new Telescope picker
                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,  -- Use the file_paths table as the source for the finder
                    }),
                    previewer = conf.file_previewer({}),  -- Use the default file previewer from Telescope
                    sorter = conf.generic_sorter({}),  -- Use the default sorter from Telescope
                }):find()  -- Display the picker
            end

            -- Open the Telescope picker for Harpoon's list
            vim.keymap.set("n", "<leader>sh", function() toggle_telescope(harpoon:list()) end,
                { desc = "Open harpoon window" })
        end,
    }
}

