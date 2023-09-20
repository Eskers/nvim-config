return {
    "akinsho/toggleterm.nvim",
    version = "*",

    config = function()
        local term_group = vim.api.nvim_create_augroup("TermBindings", { clear = true })
        vim.api.nvim_create_autocmd("TermOpen", {
            pattern = "term://*toggleterm#*",
            group = term_group,
            desc = "Terminal Keybindings",
            callback = function(event)
                local nmap = function(keys, original, desc)
                    if desc then
                        desc = "Term: " .. desc
                    end

                    vim.keymap.set("t", keys, original, { buffer = event.buf, desc = desc })
                end

                nmap("<Esc>", [[<C-\><C-n>]], "[Esc]ape")
                nmap("<C-w>h", [[<Cmd>wincmd h<CR>]], "Move to window left")
                nmap("<C-w>j", [[<Cmd>wincmd j<CR>]], "Move to window down")
                nmap("<C-w>k", [[<Cmd>wincmd k<CR>]], "Move to window above")
                nmap("<C-w>l", [[<Cmd>wincmd l<CR>]], "Move to window right")
            end,
        })

        require("toggleterm").setup({
            size = 24,
            open_mapping = [[<C-j>]],
        })
    end
}
