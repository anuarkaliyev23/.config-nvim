local randomness = require("randomness")
local config = {
	logLevel = 'info',
	defaults = {
		integers = {
			min = 0,
			max = 100,
		},

		arrays = {
			delimiter = ",",
			openingBracket = "[",
			closingBracket =  "]",
			length = 10,
		}
	}
}

randomness:setup(config)
