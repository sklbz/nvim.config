return {
	{
		"simrat39/rust-tools.nvim",
		config = function()
			local rt = require("rust-tools")

			rt.setup({
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
}
