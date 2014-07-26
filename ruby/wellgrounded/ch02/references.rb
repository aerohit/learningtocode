abc = "hello"
pqr = abc
abc.replace("world")
puts pqr

def change_string(str)
  str.replace("New string")
end

str = "Old string"
change_string(str)
puts str

# Duplicating objects
# Duplicating a frozen object produces a non-frozen object
change_string(pqr.dup)
puts pqr

# Freezing objects
abc.freeze
# both would throw exceptions
#change_string(abc)
#change_string(pqr)

# Cloning objects
# cloning a frozen object produces a frozen object
xyz = pqr.clone
