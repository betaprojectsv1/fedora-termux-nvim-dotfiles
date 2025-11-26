-- La función setup() de Lualine se llama desde plugins/init.lua
return {
  setup = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto", -- 'auto' usará los colores de tu colorscheme (tokyonight)
        -- Puedes probar 'powerline' o 'arrow' si quieres un separador entre secciones
        component_separators = { left = '', right = ''}, -- Símbolos de separación (requiere Nerd Font)
        section_separators = { left = '', right = ''},   -- Símbolos de sección (requiere Nerd Font)
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        always_last_session = true, -- Guarda la última sesión del archivo
      },
      sections = {
        -- Sección izquierda: Modo, nombre de archivo, git, LSP
        lualine_a = {'mode'}, -- Modo de Neovim (NORMAL, INSERT, etc.)
        lualine_b = {'filename', 'branch'}, -- Nombre del archivo, rama de Git
        lualine_c = {
          -- Diagnósticos de LSP (errores, advertencias, info)
          {
            'diagnostics',
            sources = {'nvim_lsp'},
            symbols = {error = ' ', warn = ' ', info = ' '}, -- Requiere Nerd Font
          }
        },
        -- Sección central: Nada por defecto o un mensaje personalizado
        lualine_x = {},
        -- Sección derecha: Tipo de archivo, codificación, posición
        lualine_y = {'filetype', 'encoding', 'fileformat'},
        lualine_z = {'progress', 'location'}, -- Progreso del archivo, línea/columna
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {}, -- No mostrar tabline por defecto
      extensions = {'nvim-tree', 'lazy'}, -- Integración con otros plugins (ej. NvimTree)
    })
  end,
}
