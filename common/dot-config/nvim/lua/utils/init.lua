local M = {}

-- Merge two tables, with second table taking precedence
function M.merge_tables(t1, t2)
	local result = {}

	-- Copy first table
	for k, v in pairs(t1) do
		result[k] = v
	end

	-- Overlay second table
	for k, v in pairs(t2) do
		result[k] = v
	end

	return result
end

-- Merge arrays
function M.merge_arrays(arr1, arr2)
	local result = {}

	-- Add all elements from first array
	for _, v in ipairs(arr1) do
		table.insert(result, v)
	end

	-- Add all elements from second array
	for _, v in ipairs(arr2) do
		table.insert(result, v)
	end

	return result
end

return M

