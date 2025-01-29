-- vim.cmd.colorscheme("catppuccin-latte")
vim.cmd.colorscheme("badwolf")

vim.api.nvim_set_keymap("n", ",,", ":w<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", ",,", "<esc>:w<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><space>", ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ntff", ":NvimTreeFindFile<CR>", { noremap = true })

-- todo: check if this is necessary anymore after configuring nvim-cmp
-- vim.api.nvim_set_keymap("i", "<c-space>", "<C-n>", { noremap = true })

vim.api.nvim_set_keymap("v", "Y", ":OSCYankVisual<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "Y", ":OSCYankVisual<CR>", { noremap = true })

-- always join lines without the resulting whitespace space in between
vim.api.nvim_set_keymap("n", "J", "gJi <ESC>diw", { noremap = true })
-- highlight but don't jump to next occurrence
vim.api.nvim_set_keymap("n", "*", "*``", { noremap = true })

-- easy debugging snippet
vim.cmd([[autocmd FileType python inoremap <C-v> import ipdb; ipdb.set_trace()]])
vim.cmd([[autocmd FileType ruby inoremap <C-v> binding.pry]])

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.cmd([[set number relativenumber]])
vim.cmd([[syntax on]])
vim.cmd([[set undofile]])
vim.cmd([[set signcolumn=yes]])
vim.cmd([[set cursorline cursorcolumn]])
vim.cmd([[set nowrap]])
vim.cmd([[set clipboard=unnamed]])

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-left>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-down>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-up>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-right>", "<C-w>l", { noremap = true })

vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- Save/load folds when closing/opening files.
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = { "*.*" },
	desc = "save view (folds), when closing file",
	command = "mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*.*" },
	desc = "load view (folds), when opening file",
	command = "silent! loadview",
})
--
-- local function add_virtual_text(text, hl_group)
-- 	local bufnr = vim.api.nvim_get_current_buf()
-- 	local line = vim.api.nvim_win_get_cursor(0)[1] - 1
--
-- 	-- Get the namespace ID (use 0 to create a new namespace)
-- 	local ns_id = vim.api.nvim_create_namespace("example_namespace")
--
-- 	print(vim.inspect(text))
--
-- 	-- Add virtual text
-- 	vim.api.nvim_buf_set_extmark(bufnr, ns_id, line, 0, {
-- 		virt_text = { { text, hl_group } },
-- 		virt_text_pos = "eol", -- Position at the end of the line
-- 	})
-- end
--
-- local function bencode(data)
-- 	if type(data) == "string" then
-- 		-- Use string.len to ensure accurate byte count
-- 		local length = string.len(data)
-- 		return string.format("%d:%s", length, data)
-- 	elseif type(data) == "number" and math.floor(data) == data then
-- 		return string.format("i%de", data)
-- 	elseif type(data) == "table" then
-- 		-- Check if table is an array
-- 		local is_array = true
-- 		local max_index = 0
-- 		for k, _ in pairs(data) do
-- 			if type(k) ~= "number" or k < 1 or math.floor(k) ~= k then
-- 				is_array = false
-- 				break
-- 			end
-- 			max_index = math.max(max_index, k)
-- 		end
--
-- 		if is_array and max_index == #data then
-- 			-- Encode list
-- 			local parts = { "l" }
-- 			for _, v in ipairs(data) do
-- 				table.insert(parts, bencode(v))
-- 			end
-- 			table.insert(parts, "e")
-- 			return table.concat(parts)
-- 		else
-- 			-- Encode dictionary
-- 			local parts = { "d" }
-- 			local keys = {}
-- 			for k, _ in pairs(data) do
-- 				table.insert(keys, k)
-- 			end
-- 			table.sort(keys) -- Keys must be sorted
-- 			for _, k in ipairs(keys) do
-- 				table.insert(parts, bencode(tostring(k)))
-- 				table.insert(parts, bencode(data[k]))
-- 			end
-- 			table.insert(parts, "e")
-- 			return table.concat(parts)
-- 		end
-- 	end
-- 	error("Cannot bencode value of type " .. type(data))
-- end
--
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
-- local function eval_selection()
-- 	local ts = vim.treesitter
-- 	local node = ts.get_node()
-- 	local text_node = ts.get_node_text(node, 0)
-- 	local node_type = node:type()
--
-- 	print(node_type)
--
-- 	if node_type == "comment" then
-- 		local uncommented_code = text_node:gsub("^#+%s*", "")
--
-- 		return uncommented_code
-- 	elseif node_type == "identifier" or node_type == "do_block" then
-- 		local parent = node:parent()
-- 		local text = ts.get_node_text(parent, 0)
--
-- 		return text
-- 	else
-- 		return text_node
-- 	end
-- end
--
-- local function send_eval_request(args)
-- 	local mode = args.mode
-- 	local socket = require("socket")
-- 	local client = socket.tcp()
-- 	local success, err = client:connect("localhost", 7888)
--
-- 	if not success then
-- 		print("Connection failed: " .. tostring(err))
-- 		return
-- 	end
--
-- 	local msg = bencode({
-- 		code = eval_selection(),
-- 		op = "eval",
-- 	})
--
-- 	client:send(msg)
-- 	client:settimeout(1)
--
-- 	-- Try to receive data in chunks
-- 	local response = ""
-- 	while true do
-- 		local chunk, status, partial = client:receive(1024)
--
-- 		if chunk then
-- 			response = response .. chunk
-- 		elseif status == "timeout" then
-- 			if partial and #partial > 0 then
-- 				response = response .. partial
-- 			end
-- 			break
-- 		else
-- 			break
-- 		end
-- 	end
--
-- 	-- print(vim.inspect({ response = response, decoded = bdecode(response) }))
--
-- 	if #response > 0 then
-- 		local decoded = bdecode(response)
-- 		local value = decoded["value"]
--
-- 		if mode == "append_as_comment" then
-- 			add_virtual_text(value, "Comment")
-- 		end
--
-- 		if mode == "append_to_tab" then
-- 			local buffer_name = "ev-log-" .. vim.fn.getpid() .. ".rb"
-- 			local existing_buffer_number
--
-- 			-- Search for a buffer by name
-- 			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
-- 				if vim.api.nvim_buf_get_name(buf):sub(-#buffer_name) == buffer_name then
-- 					existing_buffer_number = buf
-- 				end
-- 			end
--
-- 			if existing_buffer_number then
-- 				-- Append to the existing evaluation logs, rather than overwriting the whole buffer
-- 				local line_count = vim.api.nvim_buf_line_count(existing_buffer_number)
-- 				vim.api.nvim_buf_set_name(existing_buffer_number, buffer_name)
--
-- 				local index = line_count + 1
-- 				for match in value:gmatch("[^\r\n]+") do
-- 					vim.api.nvim_buf_set_lines(existing_buffer_number, index, index, false, { match })
-- 					index = index + 1
-- 				end
-- 			else
-- 				local output_buffer = vim.api.nvim_create_buf(true, false)
-- 				vim.api.nvim_buf_set_name(output_buffer, buffer_name)
-- 				-- vim.api.nvim_buf_set_lines(output_buffer, 0, -1, false, { decoded["value"] })
-- 				local index = 0
-- 				for match in value:gmatch("[^\r\n]+") do
-- 					vim.api.nvim_buf_set_lines(output_buffer, index, -1, false, { match })
-- 					index = index + 1
-- 				end
-- 				vim.cmd("tabnew")
-- 				vim.api.nvim_set_current_buf(output_buffer)
-- 				vim.api.nvim_set_option_value("wrap", true, { win = vim.fn.bufwinid(output_buffer) })
-- 			end
-- 		end
-- 	end
--
-- 	client:close()
-- end
--
-- -- Whole buffer code
-- local function get_buffer_nodes()
-- 	local ts = vim.treesitter
-- 	local bufnr = vim.api.nvim_get_current_buf()
-- 	local parser = ts.get_parser(bufnr) -- Attach Treesitter parser
-- 	local tree = parser:parse()[1] -- Get the first syntax tree
-- 	local root = tree:root() -- Get the root node of the tree
--
-- 	-- Get the whole text of the root node
-- 	local start_row, start_col, end_row, end_col = root:range()
-- 	local lines = vim.api.nvim_buf_get_lines(bufnr, start_row, end_row + 1, false)
--
-- 	-- Adjust the first and last line based on column offsets
-- 	if #lines > 0 then
-- 		lines[1] = string.sub(lines[1], start_col + 1)
-- 		lines[#lines] = string.sub(lines[#lines], 1, end_col)
-- 	end
--
-- 	local result = table.concat(lines, "\n")
--
-- 	print(vim.inspect(result))
--
-- 	return result
-- end
--
-- vim.keymap.set("n", "<leader>ee", function()
-- 	send_eval_request({ mode = "append_as_comment" })
-- end, { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>et", function()
-- 	send_eval_request({ mode = "append_to_tab" })
-- end, { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>eb", get_buffer_nodes, { noremap = true, silent = false })
