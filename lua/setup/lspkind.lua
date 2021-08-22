require('lspkind').init({
	-- enables text annotations
	-- 	default: true
	with_text = true,

	-- default symbol map
	-- can be either 'default' (requires nerd-fonts font) or
	-- 'codicons' for codicon preset (requires vscode-codicons font)
	-- 	default: 'default'
	preset = 'codicons',

	-- override preset symbols
	-- 	default: {}
	symbol_map = {
		Class = "ﴯ",
		Color = "",
		Constant = "",
		Constructor = "",
		Enum = "",
		EnumMember = "",
		Event = "",
		Field = "ﰠ",
		File = "",
		Folder = "",
		Function = "",
		Interface = "",
		Keyword = "",
		Method = "",
		Module = "",
		Operator = "",
		Property = "ﰠ",
		Reference = "",
		Snippet = "",
		Struct = "פּ",
		Text = "",
		TypeParameter = "",
		Unit = "塞",
		Value = "",
		Variable = "",
	},
})
