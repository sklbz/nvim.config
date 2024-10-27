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
			local dap_adapter = rt.dap.get_codelldb_adapter(codelldb_path, liblldb_path)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local tools = {
				runnables = {
					use_telescope = true,
				},
				hover_actions = {
					auto_focus = true,
				},
			}
			local inlay_hints = {
				auto = true,
				only_current_line = false,
				show_parameter_hints = false,
				-- parameter_hints_prefix = "",
				-- other_hints_prefix = "",
				max_len = 100,
				prefix = " ",
			}

			local opts = {
				dap = {
					adapter = dap_adapter,
				},
				server = {
					capabilities = capabilities,
				},
				tools = tools,
				inlay_hints = inlay_hints,
			}

			rt.setup(opts)

			vim.keymap.set(
				"n",
				"<leader>cag",
				rt.code_action_group.code_action_group,
				{ desc = "[C]ode [A]ction [G]roup" }
			)
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "toml", "rust" },
		config = function()
			local crates = require("crates")
			crates.setup({})
			crates.show()

			vim.keymap.set("n", "<leader>uc", crates.upgrade_all_crates, { desc = "[U]pgrade [C]rates" })
			vim.keymap.set("n", "<leader>u.", crates.upgrade_crate, { desc = '[u]pgrade crate ("." for single crate)' })
		end,
	},
}
