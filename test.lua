function ends_with(str, ending)
	return ending == "" or str:sub(-#ending) == ending
end

-- Example usage
print(ends_with("hello world", "world")) -- true
print(ends_with("hello world", "hello")) -- false
print(ends_with("hello world", "")) -- true
