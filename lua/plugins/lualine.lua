return {
    {
        "nvim-lualine/lualine.nvim",
        -- `lazy = false
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Necesario para los iconos de archivo
        config = function()
            require("config.ui.statusline").setup()
        end,
    }
}
