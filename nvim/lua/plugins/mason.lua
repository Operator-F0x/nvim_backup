return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- Setup base mason configuration
		require("mason").setup()

		-- Configurazione di mason-lspconfig
		require("mason-lspconfig").setup({
			-- Automatic installation of LSP servers
			automatic_installation = true,
			-- Specific LSP servers to ensure are installed
			ensure_installed = {
				"clangd", -- per C e C++
				"cssls", -- CSS LSP
				"eslint", -- ESLint LSP
				"html", -- HTML LSP
				"jsonls", -- JSON LSP
				"pyright", -- Python LSP
				"tailwindcss", -- TailwindCSS LSP
				"ts_ls", -- Riaggiunto TypeScript Language Server
			},
		})

		-- Configurazione per mason-tool-installer (installazione automatica di tool)
		require("mason-tool-installer").setup({
			-- Lista dei tool da installare automaticamente
			ensure_installed = {
				"prettier", -- Formatter per codice (JavaScript/HTML/CSS)
				"stylua", -- Formatter per Lua
				"isort", -- Formatter per Python
				"black", -- Formatter per Python
				"pylint", -- Linter per Python
				"eslint_d", -- ESLint in modalità daemon
			},
		})

		-- Configurazione LSP per clangd (C/C++)
		require("lspconfig").clangd.setup({
			on_attach = function(client, bufnr)
				-- Imposta il formato automatico al salvataggio
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("Format", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
			-- Abilita le capacità di completamento per cmp
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		-- Configurazione LSP per TypeScript (ts_ls)
		require("lspconfig").ts_ls.setup({
			on_attach = function(client, bufnr)
				-- Imposta il formato automatico al salvataggio
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("Format", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
		-- Configurazione LSP per Python (Pyright)
		require("lspconfig").pyright.setup({
			on_attach = function(client, bufnr)
				-- Imposta il formato automatico al salvataggio
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("Format", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
			-- Abilita le capacità di completamento per cmp
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
		-- Configurazione LSP per altri server come ESLint, CSSLS, HTML, ecc.
		require("lspconfig").cssls.setup({
			on_attach = function(client, bufnr)
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("Format", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		require("lspconfig").eslint.setup({
			on_attach = function(client, bufnr)
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("Format", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		require("lspconfig").html.setup({
			on_attach = function(client, bufnr)
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("Format", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		require("lspconfig").jsonls.setup({
			on_attach = function(client, bufnr)
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("Format", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		require("lspconfig").pyright.setup({
			on_attach = function(client, bufnr)
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("Format", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		require("lspconfig").tailwindcss.setup({
			on_attach = function(client, bufnr)
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("Format", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
	end,
}
