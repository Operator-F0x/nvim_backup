vim.g.mapleader = " " -- Imposta il tasto leader come spazio

local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Salva il file corrente
map("n", "<leader>w", "<CMD>update<CR>")

-- Chiudi il buffer corrente
map("n", "<leader>q", "<CMD>q<CR>")

-- Esci dalla modalità di inserimento premendo "jk" rapidamente
map("i", "jk", "<ESC>")

-- Gestione NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>") -- Alterna la visualizzazione di NeoTree
map("n", "<leader>r", "<CMD>Neotree focus<CR>") -- Porta NeoTree in primo piano

-- Apertura di nuove finestre
map("n", "<leader>o", "<CMD>vsplit<CR>") -- Apre una finestra verticale
map("n", "<leader>p", "<CMD>split<CR>") -- Apre una finestra orizzontale

-- Navigazione tra finestre aperte
map("n", "<C-h>", "<C-w>h") -- Sposta il focus alla finestra a sinistra
map("n", "<C-l>", "<C-w>l") -- Sposta il focus alla finestra a destra
map("n", "<C-k>", "<C-w>k") -- Sposta il focus alla finestra sopra
map("n", "<C-j>", "<C-w>j") -- Sposta il focus alla finestra sotto

-- Ridimensionamento delle finestre
map("n", "<C-Left>", "<C-w><") -- Riduci la larghezza della finestra
map("n", "<C-Right>", "<C-w>>") -- Aumenta la larghezza della finestra
map("n", "<C-Up>", "<C-w>+") -- Aumenta l'altezza della finestra
map("n", "<C-Down>", "<C-w>-") -- Riduci l'altezza della finestra

-- Apre un terminale in una finestra orizzontale divisa
map("n", "<leader>t", "<CMD>split | terminal<CR>")
-- Con questa mappatura, premendo `<leader>t` (tasto leader + t), si apre un terminale in basso,
-- dividendo lo schermo orizzontalmente. È utile per lavorare nel terminale senza uscire da Neovim.

-- Generate Assembly in a Horizontal Split
-- Usa il compilatore GCC per creare un assembly del file corrente in Intel syntax
-- <leader>ca: compila il file corrente e mostra l'output assembly in una nuova finestra divisa
map("n", "<leader>ca", "<CMD>vsplit | term gcc -S -o - % -masm=intel<CR>")
