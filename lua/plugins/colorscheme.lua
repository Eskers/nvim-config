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

            diagnostics = {
                undercurl = false,
            }
        })

        require("onedark").load()
    end,
}
