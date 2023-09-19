return {
    -- "rebelot/kanagawa.nvim",
    -- priority = 1000,
    -- config = function()
    --     vim.cmd.colorscheme "kanagawa-dragon"

    "navarasu/onedark.nvim",
    priority = 1000,

    config = function()
        require("onedark").setup({
            style = "warm",

            -- Don't make comments italic
            code_style = {
                comments = "none",
            },

            -- For using vim-illuminate with visual background
            highlights = {
                IlluminatedWordText = { bg = "#3b3f4c" },
                IlluminatedWordRead = { bg = "#3b3f4c" },
                IlluminatedWordWrite = { bg = "#3b3f4c" },
            },

            diagnostics = {
                undercurl = false,
            }
        })

        require("onedark").load()
    end,
}
