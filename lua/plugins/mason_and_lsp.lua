return {
  -- Instala el cliente LSP y el gestor de paquetes de Mason
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },

  -- Instala los Language Servers y conecta Mason con nvim-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp", -- Necesario para la función on_attach
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Lógica común de adjunto (on_attach)
      local on_attach = function(client, bufnr)
        require("cmp.config.lsp").on_attach(client, bufnr)
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      end

      -- Configura Mason para usar los setup_handlers
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "bashls",
          "zls"
        },
        -- Este handler se aplica a CADA servidor instalado por Mason
        handlers = {
          function(server_name)
            local lspconfig = require('lspconfig')
            lspconfig[server_name].setup({
              on_attach = on_attach,
            })
          end,
        },
      })
    end,
  },

  -- El plugin nvim-lspconfig se carga como dependencia,
  -- pero su configuración (setup) es manejada por mason-lspconfig.
  {
    "neovim/nvim-lspconfig",
    -- No es necesario un bloque 'config' aquí ya que Mason lo maneja.
  }
}
