return {
	{
		"simrat39/rust-tools.nvim",
		config = function()
			local rt = require("rust-tools")
			local mason_reg = require("mason_registry")

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
					on_attach = function(_, bufnr)
						vim.keymaps.set("n", "<leader>k", rt.hover_action.hover_action, { buffer = bufnr })
						vim.keymaps.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
					end,
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

			vim.keymaps.set("n", "<leader>cu", crates.upgrade_all_crates)
		end,
	},
}
