return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", 
        event = "VeryLazy", 
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "vim", "json", "yaml", "zig", "nim" },
                highlight = { enable = true }, 
                indent = { enable = true },  
            })
        end,
    }
}

