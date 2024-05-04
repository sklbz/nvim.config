return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local line_options = require("plugins.config.lualine-options")
		local sections_options = require("plugins.config.lualine-sections")
		require("lualine").setup({
			options = line_options,
			sections = sections_options,
		})
	end,
}
