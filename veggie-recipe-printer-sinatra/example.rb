require "erb"

name = "Alex"
message = "Hello, <%= name %>."
erb = ERB.new(message)

puts erb.result  # => "Hello, Dan."
