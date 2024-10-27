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
		opts = {
			tools = {
				runnables = {
					use_telescope = true,
				},
				inlay_hints = {
					auto = true,
					only_current_line = false,
					show_parameter_hints = false,
					-- parameter_hints_prefix = "",
					-- other_hints_prefix = "",
					max_len = 100,
					prefix = " ",
				},
			},
		},
	},
	config = function()
		local lspconf = require("lspconfig")

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local lsp_list = require("plugins.config.lsp.lsp-list")

		for _, lsp in ipairs(lsp_list) do
			local suffix = lsp == "dcm" and "ls" or ""

			local opts = lsp == "rust_analyzer" and require("plugins.config.lsp.rust-analyzer-opts") or {}

			lspconf[lsp .. suffix].setup({
				capabilities = capabilities,
				opts,
			})
		end

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

		require("plugins.config.lsp.keymaps")
	end,
}, {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = {
		auto_update = true,
		ensure_installed = require("plugins.config.lsp.ensure-installed"),
	},
}
