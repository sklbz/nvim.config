return {
	{
		"simrat39/rust-tools.nvim",
		config = function()
			local rt = require("rust-tools")
			local mason_reg = require("mason-registry")

			local codelldb = mason_reg.get_package("codelldb")
			local extension_path = codelldb:get_install_path() .. "/extensions/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

			rt.setup({
				dap = {
					adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
				},
				server = {
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
				},
				tools = {
					hover_actions = {
						auto_focus = true,
					},
				},
			})
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "toml", "rust" },
		config = function()
			local crates = require("crates")
			crates.setup({})
			crates.show()

			vim.keymap.set("n", "<leader>ruc", crates.upgrade_all_crates, { desc = "[U]pgrade [A]ll [C]rates" })
			vim.keymap.set("n", "<leader>rt", '<cmd>echo "test:<CR>', { desc = "TEST" })
		end,
	},
}
