require 'stringio'
require 'pp'

def capture_pretty_print(code)
  original_stdout = $stdout
  output = StringIO.new
  $stdout = output
  
  puts PP.pp(eval(code), "".dup, 12)
  result = output.string
  
  $stdout = original_stdout
  
  # pp result, $stdout, original_stdout, output
  result
end

# Example usage
code = <<~CODE
  [
    1,
    2,
    3,
    {
      :a => 1,
      :b => 2
    },
    "Lorem\nIpsum"
  ]
CODE
result = capture_pretty_print(code)
p result
result.split(",\n").each {puts _1}
puts result
