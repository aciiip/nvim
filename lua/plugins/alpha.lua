return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.header.val = {
			[[  .----------------.  .----------------.  .----------------.  .----------------.  ]],
			[[ | .--------------. || .--------------. || .--------------. || .--------------. | ]],
			[[ | |      __      | || |     ______   | || |     _____    | || |   ______     | | ]],
			[[ | |     /  \     | || |   .' ___  |  | || |    |_   _|   | || |  |_   __ \   | | ]],
			[[ | |    / /\ \    | || |  / .'   \_|  | || |      | |     | || |    | |__) |  | | ]],
			[[ | |   / ____ \   | || |  | |         | || |      | |     | || |    |  ___/   | | ]],
			[[ | | _/ /    \ \_ | || |  \ `.___.'\  | || |     _| |_    | || |   _| |_      | | ]],
			[[ | ||____|  |____|| || |   `._____.'  | || |    |_____|   | || |  |_____|     | | ]],
			[[ | |              | || |              | || |              | || |              | | ]],
			[[ | '--------------' || '--------------' || '--------------' || '--------------' | ]],
			[[  '----------------'  '----------------'  '----------------'  '----------------'  ]],
		}

		alpha.setup(dashboard.opts)
	end,
}
