obj = Object.new

def obj.talk
  puts "I am an object."
  puts "Do you object?"
end

def obj.sum(a, b)
  puts "The sum of #{a} and #{b} is #{a + b}"
end

# Parenthesis are optional
def obj.product a, b
  puts "The product of #{a} and #{b} is #{a * b}"
end

def obj.multi_args(*x)
  puts "I can take zero or more arguments #{x}"
end

def obj.args_unleased(a, b=1, *c, d, e)
  puts "Arguments:"
  p a, b, c, d, e
end

obj.talk
obj.sum(3, 4)
obj.product 3, 4

obj.multi_args 1, 2, 3
obj.args_unleased 1, 2, 3, 4, 5
obj.args_unleased 9, 8, 7
