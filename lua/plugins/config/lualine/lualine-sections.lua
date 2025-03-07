return {
	lualine_a = { "mode" },
	lualine_b = { "diff",
		{
			"diagnostics",
			symbols = { error = ' ', warn = ' ', info = ' ' },
		}
	},
	lualine_c = {
		{
			"filetype",
			icon_only = true,
			padding = { left = 1, right = 0 },
		},
		{
			"buffers",
			icons_enabled = false,
		},
	},
	lualine_x = {
		{
			-- Lsp server name
			function()
				local msg = 'No Active Lsp'
				local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
				local clients = vim.lsp.get_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end,
			icon = ' LSP:',
			color = { fg = '#ffffff', gui = 'bold' },
		}
	},
	lualine_y = {},
	lualine_z = {}
	-- lualine_x = { "fileformat" },
	-- lualine_y = { "progress" },
	-- lualine_z = { "location" },
}
