-- Configuración de numeración
vim.opt.number = true  
vim.opt.relativenumber = true  -- Muestra los números de línea relativos (útil para saltos con G/k)
--
-- -- Configuración de indentación
vim.opt.tabstop = 4            -- Número de espacios que ocupa un tab
vim.opt.shiftwidth = 4         -- Número de espacios que usa la indentación automática
vim.opt.expandtab = true       -- Usa espacios en lugar de tabs al presionar <Tab>
vim.opt.autoindent = true      -- Mantiene la indentación al crear nuevas líneas
vim.opt.smartindent = true     -- Indenta automáticamente las nuevas líneas de forma más inteligente
--
-- -- Configuración de envoltura de línea
vim.opt.wrap = false           -- Deshabilita el auto-envoltorio de líneas largas
--
-- -- Configuración de búsqueda
vim.opt.incsearch = true       -- Resalta las coincidencias de búsqueda mientras escribes
vim.opt.hlsearch = true        -- Resalta todas las coincidencias después de la búsqueda
vim.opt.ignorecase = true      -- Ignora mayúsculas/minúsculas en la búsqueda...
vim.opt.smartcase = true       -- ...a menos que la búsqueda contenga mayúsculas
--
-- -- Comportamiento de la línea de comandos
vim.opt.cmdheight = 1          -- Altura de la línea de comandos (minimalista)
--
-- -- Aspecto visual
vim.opt.termguicolors = true   -- Habilita colores verdaderos (RGB) si tu terminal lo soporta (Termux lo hace)
vim.opt.scrolloff = 8          -- Mantiene 8 líneas de contexto al desplazarse
vim.opt.sidescrolloff = 8      -- Mantiene 8 columnas de contexto al desplazarse horizontalmente
vim.opt.signcolumn = "yes"     -- Siempre muestra la columna de signos (diagnósticos, git)
vim.opt.cursorline = true      -- Resalta la línea actual del cursor
vim.opt.mouse = "a"            -- Habilita el soporte del ratón en todos los modos
--
-- -- Comportamiento de archivos y escritura
vim.opt.undofile = true        -- Persiste el historial de deshacer después de cerrar el archivo
vim.opt.swapfile = false       -- Deshabilita la creación de archivos swap (mejora rendimiento y evita basura)
vim.opt.backup = false         -- Deshabilita la creación de archivos de respaldo
vim.opt.writebackup = false    -- Deshabilita el respaldo antes de sobrescribir (si `backup` es false)
--
-- -- Comportamiento de ventanas divididas
vim.opt.splitright = true      -- Nuevas ventanas verticales se abren a la derecha
vim.opt.splitbelow = true      -- Nuevas ventanas horizontales se abren abajo
--
-- -- Rendimiento y suavidad
vim.opt.updatetime = 300       -- Tiempo en ms para actualizar los diagnósticos y 'CursorHold' (300ms es un buen equilibrio)
vim.opt.timeoutlen = 500       -- Tiempo en ms para esperar por secuencias de mapeo (ej. <leader>rn)
