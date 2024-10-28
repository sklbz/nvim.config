return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufReadPost",
	config = function()
		local ibl = require("ibl")
		ibl.setup({
			show_current_context = true,
		})
	end,
}