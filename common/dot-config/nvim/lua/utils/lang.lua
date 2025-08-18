local utils = require("utils")
local M = {}

-- Collect all language configurations
function M.get_all_configs()
	local configs = {}
	local lang_path = vim.fn.stdpath("config") .. "/lua/lang"

	-- Check if lang directory exists
	if vim.fn.isdirectory(lang_path) == 0 then
		return configs
	end

	-- Get all lua files in lang directory except init.lua
	local files = vim.fn.glob(lang_path .. "/*.lua", false, true)

	for _, file in ipairs(files) do
		local filename = vim.fn.fnamemodify(file, ":t:r")
		if filename ~= "init" then
			local ok, config = pcall(require, "lang." .. filename)
			if ok and config then
				configs[filename] = config
			end
		end
	end

	return configs
end

-- Get LSP servers from all language configs
function M.get_lsp_servers()
	local servers = {}
	local configs = M.get_all_configs()

	for _, config in pairs(configs) do
		if config.lsp then
			for server, _ in pairs(config.lsp) do
				table.insert(servers, server)
			end
		end
	end

	return servers
end

-- Get LSP server configurations from all language configs
function M.get_lsp_configs()
	local lsp_configs = {}
	local configs = M.get_all_configs()

	for _, config in pairs(configs) do
		if config.lsp then
			for server, server_config in pairs(config.lsp) do
				lsp_configs[server] = server_config
			end
		end
	end

	return lsp_configs
end

-- Get treesitter parsers from all language configs
function M.get_treesitter_parsers()
	local parsers = {}
	local configs = M.get_all_configs()

	for _, config in pairs(configs) do
		if config.treesitter then
			for _, parser in ipairs(config.treesitter) do
				table.insert(parsers, parser)
			end
		end
	end

	return parsers
end

-- Get formatters from all language configs
function M.get_formatters()
	local formatters = {}
	local configs = M.get_all_configs()

	for _, config in pairs(configs) do
		if config.formatters then
			for filetype, formatter_list in pairs(config.formatters) do
				formatters[filetype] = formatter_list
			end
		end
	end

	return formatters
end

-- Get all formatter tools from language configs, safely extracting only tool names
function M.get_all_formatter_tools()
	local tools = {}
	local seen = {}

	-- Get formatters from language configs
	local lang_formatters = M.get_formatters()
	for _, formatter_list in pairs(lang_formatters) do
		for _, item in ipairs(formatter_list) do
			-- Only add strings (tool names), skip key-value options like stop_at_first = true
			if type(item) == "string" and not seen[item] then
				table.insert(tools, item)
				seen[item] = true
			end
		end
	end

	return tools
end

-- Delegate to generic utils
M.merge_tables = utils.merge_tables
M.merge_arrays_unique = utils.merge_arrays_unique

return M
