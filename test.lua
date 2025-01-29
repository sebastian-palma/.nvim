local decoded = {
	value = [[
  [#<Car:0x0000000104e6c170\n  id: 1,\n  brand:\n   "Toyota",\n  model:\n   "Piece of moving shit",\n  created_at:\n   Fri, 10 Jan 2025 20:42:00.850977000 UTC +00:00,\n  updated_at:\n   Fri, 10 Jan 2025 20:42:00.850977000 UTC +00:00>,\n #<Car:0x0000000104e4ef80\n  id: 2,\n  brand:\n   "the best",\n  model:\n   "krowek",\n  created_at:\n   Fri, 10 Jan 2025 22:49:57.237864000 UTC +00:00,\n  updated_at:\n   Fri, 10 Jan 2025 22:49:57.237864000 UTC +00:00>,\n #<Car:0x00000001056d42b8\n  id: 3,\n  brand:\n   "the best",\n  model:\n   "krowek",\n  created_at:\n   Fri, 10 Jan 2025 22:50:06.456908000 UTC +00:00,\n  updated_at:\n   Fri, 10 Jan 2025 22:50:06.456908000 UTC +00:00>]\n
  ]],
}

function split_multiline(str)
	local lines = {}
	for line in str:gmatch("(.-),\n") do
		table.insert(lines, line)
	end
	return lines
end

-- Example usage
local text = decoded["value"]
local parts = split_multiline(text)
for _, part in ipairs(parts) do
	print(part)
end

-- for match in (decoded["value"] .. ",\n"):gmatch("(.-)" .. ",\n") do
-- 	print(match)
-- end

-- local function bdecode(data, pos)
-- 	pos = pos or 1
-- 	local char = data:sub(pos, pos)
--
-- 	if char:match("%d") then
-- 		-- String
-- 		local colon = data:find(":", pos)
-- 		local len = tonumber(data:sub(pos, colon - 1))
-- 		local str = data:sub(colon + 1, colon + len)
-- 		return str, colon + len + 1
-- 	elseif char == "d" then
-- 		-- Dictionary
-- 		local dict = {}
-- 		local next_pos = pos + 1
-- 		while data:sub(next_pos, next_pos) ~= "e" do
-- 			local key, new_pos = bdecode(data, next_pos)
-- 			local value
-- 			value, next_pos = bdecode(data, new_pos)
-- 			dict[key] = value
-- 		end
-- 		return dict, next_pos + 1
-- 	elseif char == "l" then
-- 		-- List
-- 		local list = {}
-- 		local next_pos = pos + 1
-- 		while data:sub(next_pos, next_pos) ~= "e" do
-- 			local value
-- 			value, next_pos = bdecode(data, next_pos)
-- 			table.insert(list, value)
-- 		end
-- 		return list, next_pos + 1
-- 	elseif char == "i" then
-- 		-- Integer
-- 		local e_pos = data:find("e", pos)
-- 		local num = tonumber(data:sub(pos + 1, e_pos - 1))
-- 		return num, e_pos + 1
-- 	end
-- end
--
-- local sort, concat, insert = table.sort, table.concat, table.insert
-- local pairs, ipairs, type, tonumber = pairs, ipairs, type, tonumber
-- local sub, find = string.sub, string.find
--
-- local function decode_integer(s, index)
-- 	local a, b, int = find(s, "^(%-?%d+)e", index)
-- 	if not int then
-- 		return nil, "not a number", nil
-- 	end
-- 	int = tonumber(int)
-- 	if not int then
-- 		return nil, "not a number", int
-- 	end
-- 	return int, b + 1
-- end
--
-- local function decode_list(s, index)
-- 	local t = {}
-- 	while sub(s, index, index) ~= "e" do
-- 		local obj, ev
-- 		obj, index, ev = decode(s, index)
-- 		if not obj then
-- 			return obj, index, ev
-- 		end
-- 		insert(t, obj)
-- 	end
-- 	index = index + 1
-- 	return t, index
-- end
--
-- local function decode_dictionary(s, index)
-- 	local t = {}
-- 	while sub(s, index, index) ~= "e" do
-- 		local obj1, obj2, ev
--
-- 		obj1, index, ev = decode(s, index)
-- 		if not obj1 then
-- 			return obj1, index, ev
-- 		end
--
-- 		obj2, index, ev = decode(s, index)
-- 		if not obj2 then
-- 			return obj2, index, ev
-- 		end
--
-- 		t[obj1] = obj2
-- 	end
-- 	index = index + 1
-- 	return t, index
-- end
--
-- local function decode_string(s, index)
-- 	local a, b, len = find(s, "^([0-9]+):", index)
-- 	if not len then
-- 		return nil, "not a length", len
-- 	end
-- 	index = b + 1
--
-- 	local v = sub(s, index, index + len - 1)
-- 	if #v < len - 1 then
-- 		return nil, "truncated string at end of input", v
-- 	end
-- 	index = index + len
-- 	return v, index
-- end
--
-- function decode(s, index)
-- 	if not s then
-- 		return nil, "no data", nil
-- 	end
-- 	index = index or 1
-- 	local t = sub(s, index, index)
-- 	if not t then
-- 		return nil, "truncation error", nil
-- 	end
--
-- 	if t == "i" then
-- 		return decode_integer(s, index + 1)
-- 	elseif t == "l" then
-- 		return decode_list(s, index + 1)
-- 	elseif t == "d" then
-- 		return decode_dictionary(s, index + 1)
-- 	elseif t >= "0" and t <= "9" then
-- 		return decode_string(s, index)
-- 	else
-- 		return nil, "invalid type", t
-- 	end
-- end
--
-- local response = [[
-- d5:value1260:[#<Car:0x00000001057a4620\n  id: 1,\n  brand: "Toyota",\n  model: "Piece of moving shit",\n  created_at: Fri, 10 Jan 2025 20:42:00.850977000 UTC +00:00,\n  updated_at: Fri, 10 Jan 2025 20:42:00.8
-- 50977000 UTC +00:00>,\n #<Car:0x000000010577dca0\n  id: 2,\n  brand: "the best",\n  model: "krowek",\n  created_at: Fri, 10 Jan 2025 22:49:57.237864000 UTC +00:00,\n  updated_at: Fri, 10 Jan 2025 22:49:57.2378
-- 64000 UTC +00:00>,\n #<Car:0x000000010576ec00\n  id: 3,\n  brand: "the best",\n  model: "krowek",\n  created_at: Fri, 10 Jan 2025 22:50:06.456908000 UTC +00:00,\n  updated_at: Fri, 10 Jan 2025 22:50:06.4569080
-- 00 UTC +00:00>]\n[#<Car:0x0000000106280968\n  id: 1,\n  brand:\n   "Toyota",\n  model:\n   "Piece of moving shit",\n  created_at:\n   Fri, 10 Jan 2025 20:42:00.850977000 UTC +00:00,\n  updated_at:\n   Fri, 10
-- Jan 2025 20:42:00.850977000 UTC +00:00>,\n #<Car:0x0000000106278330\n  id: 2,\n  brand:\n   "the best",\n  model:\n   "krowek",\n  created_at:\n   Fri, 10 Jan 2025 22:49:57.237864000 UTC +00:00,\n  updated_at:
-- \n   Fri, 10 Jan
-- ]]
--
-- print(decode(response))
