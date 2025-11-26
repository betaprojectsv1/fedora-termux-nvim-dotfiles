return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter", -- Cargar el plugin solo cuando entras al modo de inserción
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Fuente: Sugerencias del LSP
    "hrsh7th/cmp-buffer",    -- Fuente: Palabras del buffer actual
    "hrsh7th/cmp-path",      -- Fuente: Rutas de archivo
    "L3MON4D3/LuaSnip",      -- Motor de Snippets
    "saadparwaiz1/cmp_luasnip", -- Fuente: Integración de Snippets con CMP
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      -- Definición de las fuentes de sugerencias (orden de prioridad de arriba a abajo)
      sources = {
        { name = "nvim_lsp" },  -- 1. La fuente principal y más inteligente (LSP)
        { name = "luasnip" },   -- 2. Snippets
        { name = "buffer" },    -- 3. Palabras del archivo actual
        { name = "path" },      -- 4. Rutas
      },

      -- Mapeos de Teclas para la Navegación y Selección
      mapping = cmp.mapping.preset.insert({
        -- <CR> (Enter) para confirmar y seleccionar la opción actual
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        -- <C-Space> para forzar el menú de autocompletado
        ["<C-Space>"] = cmp.mapping.complete(),

        -- <Tab> y <S-Tab> para navegar entre sugerencias y saltar en snippets
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump() -- Saltar a la siguiente posición del snippet
          else
            fallback() -- Comportamiento normal del <Tab>
          end
        end, { "i", "s" }), -- En modo Insertar e Snippet

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1) -- Saltar a la posición anterior del snippet
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      -- Configuración de Snippets
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
    })
  end,
}
