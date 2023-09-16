return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            section_separators = "",
            component_separators = "|",
        }
    },
    config = function(_, opts)
        require("lualine").setup(opts)
        vim.cmd([[ :set noshowmode ]])
    end
}
