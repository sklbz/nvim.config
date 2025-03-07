return {
	lualine_a = {
		{
			function()
				return '▊'
			end,
			color = { fg = '#b4befe', bg = "#45475a" },
			padding = { left = 0, right = 0 }
		},
		{
			"mode",
			color = function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = "#89b4fa",
					i = "#a6e3a1",
					v = "#cba6f7",
					-- [''] = colors.blue,
					V = "#cba6f7",
					c = "#fab387",
					-- no = colors.red,
					-- s = colors.orange,
					-- S = colors.orange,
					-- [''] = colors.orange,
					-- ic = colors.yellow,
					-- R = colors.violet,
					-- Rv = colors.violet,
					-- cv = colors.red,
					-- ce = colors.red,
					-- r = colors.cyan,
					-- rm = colors.cyan,
					-- ['r?'] = colors.cyan,
					-- ['!'] = colors.red,
					-- t = colors.red,
				}
				return { fg = mode_color[vim.fn.mode()], bg = "#45475a" }
			end,

		},

		{
			function()
				return ''
			end,
			padding = { left = 0, right = 0 },
			color = { fg = "#45475a", bg = "#313244" }
		}
	},
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

			color = function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = "#74c7ec",
					i = "#94e2d5",
					v = "#cba6f7",
					-- [''] = colors.blue,
					V = "#cba6f7",
					c = "#fab387",
					-- no = colors.red,
					-- s = colors.orange,
					-- S = colors.orange,
					-- [''] = colors.orange,
					-- ic = colors.yellow,
					-- R = colors.violet,
					-- Rv = colors.violet,
					-- cv = colors.red,
					-- ce = colors.red,
					-- r = colors.cyan,
					-- rm = colors.cyan,
					-- ['r?'] = colors.cyan,
					-- ['!'] = colors.red,
					-- t = colors.red,
				}
				return { fg = mode_color[vim.fn.mode()] }
			end,

		},
	},
	lualine_y = {},
	lualine_z = {}
}
