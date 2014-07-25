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

obj.talk
obj.sum(3, 4)
obj.product 3, 4
