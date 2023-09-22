return {
    "navarasu/onedark.nvim",
    priority = 1000,

    config = function()
        require("onedark").setup({
            style = "warm",

            -- Don't make comments italic
            code_style = {
                comments = "none",
            },

            highlights = {
                -- Use visual color for Illuminate
                IlluminatedWordText = { bg = "#404247" },
                IlluminatedWordRead = { bg = "#404247" },
                IlluminatedWordWrite = { bg = "#404247" },
                -- And change visual to a dark blue, tried to base this
                -- of bg_blue in the warm pallet
                Visual = { bg = "#0e395d" }

            },
        })

        require("onedark").load()
    end,
}
