-- Impostazioni generali
vim.opt.number = true -- Mostra i numeri di linea
vim.opt.relativenumber = true -- Numeri di linea relativi
vim.opt.cursorline = true -- Evidenzia la riga corrente
vim.opt.tabstop = 4 -- Numero di spazi per un tab
vim.opt.shiftwidth = 4 -- Indentazione per i blocchi di codice
vim.opt.expandtab = true -- Usa spazi invece di tab
vim.opt.smartindent = true -- Abilita indentazione intelligente
vim.opt.wrap = false -- Disabilita il word wrap
vim.opt.scrolloff = 8 -- Margine di scorrimento verticale

-- Ricerca
vim.opt.ignorecase = true -- Ignora maiuscole/minuscole nella ricerca
vim.opt.smartcase = true -- Sensibile a maiuscole/minuscole se ci sono lettere maiuscole
vim.opt.incsearch = true -- Cerca durante la digitazione

-- Backup e undo
vim.opt.backup = false -- Disabilita i file di backup
vim.opt.writebackup = false -- Disabilita i backup durante la scrittura
vim.opt.undofile = true -- Abilita undo persistente
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo" -- Specifica la directory per undo

-- Impostazioni visive
vim.opt.termguicolors = true -- Abilita colori del terminale
vim.opt.signcolumn = "yes" -- Colonna dei segni sempre visibile
