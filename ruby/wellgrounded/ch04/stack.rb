require_relative 'stacklike'
class Stack
  include Stacklike
end

s = Stack.new
s.add_to_stack(4)
s.add_to_stack(7)
s.add_to_stack(9)
puts s.stack
