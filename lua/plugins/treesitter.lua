return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    opts = {
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = {
            "bash",
            "c",
            "dockerfile",
            "gitattributes",
            "gitignore",
            "json",
            "latex",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "python",
            "vimdoc"
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
        auto_install = false,

        highlight = { enable = true },
        indent = { enable = true},
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-Space>",
                node_incremental = "<C-Space>",
                scope_incremental = "<C-s>",
                node_decremental = "<M-q>",
            },
        },
    },

    config = function(_, opts)
        if type(opts.ensure_installed) == "table" then
            ---@type table<string, boolean>
            local added = {}
            opts.ensure_installed = vim.tbl_filter(function(lang)
                if added[lang] then
                    return false
            end
            added[lang] = true
                return true
            end, opts.ensure_installed)
        end
        require("nvim-treesitter.configs").setup(opts)
    end,
}
