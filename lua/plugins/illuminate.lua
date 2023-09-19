return {
    "https://github.com/RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile"},

    config = function()
        require("illuminate").configure({})

    end,
}
