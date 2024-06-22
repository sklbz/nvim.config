return {
	{
		"williamboman/mason.nvim",
		dependencies = { "mason-org/mason-registry" },
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconf = require("lspconfig")
			lspconf.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconf.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust_analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			})

			lspconf.tsserver.setup({
				capabilities = capabilities,
			})

			lspconf.clangd.setup({
				capabilities = capabilities,
			})

			lspconf.bashls.setup({
				capabilities = capabilities,
			})

			lspconf.dcmls.setup({
				capabilities = capabilities,
			})

			require("plugins.config.lsp.keymaps")
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			auto_update = true,
			ensure_installed = require("plugins.config.lsp.ensure-installed"),
		},
	},
}
