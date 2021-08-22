require('telescope').setup{
	defaults = {
		file_ignore_patterns = {
			'target/.*' -- Rust build folder
		},
	}
}
