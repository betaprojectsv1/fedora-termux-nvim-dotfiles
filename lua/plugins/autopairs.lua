return {

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter", 
        config = function()
        -- Carga el módulo de autopairs
        local autopairs = require("nvim-autopairs")

        -- Configuración básica de autopairs
        autopairs.setup({
     
        })

        local cmp_setup_ok, cmp = pcall(require, "cmp")
        if cmp_setup_ok then  
        end
        end,
    }

}


