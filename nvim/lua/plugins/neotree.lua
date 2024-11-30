return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- Configura NeoTree
		require("neo-tree").setup({
			window = {
				position = "left", -- Posizione a sinistra, ma puoi cambiarla
			},
		})

		-- Apri NeoTree al lancio di Neovim
		vim.cmd("Neotree toggle")
	end,
}
