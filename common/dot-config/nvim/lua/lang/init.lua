local M = {}

-- Load all language configurations
local function load_languages()
	local utils = require("utils.lang")
	return utils.get_all_configs()
end

-- Get language configuration by name
function M.get_config(language)
	local configs = load_languages()
	return configs[language]
end

-- Get all loaded language configurations
function M.get_all_configs()
	return load_languages()
end

return M

