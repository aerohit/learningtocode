class Person
  def species
    "Homo sapiens"
  end
end

class Rubyist < Person
end

rubyist = Rubyist.new

class Publication
  attr_accessor :publisher
end

class Magazine < Publication
  attr_accessor :editor
end

class Ezine < Magazine
end

mag = Magazine.new
mag.publisher = "David A. Black"
mag.editor = "Joe Smith"
puts "Mag is published by #{mag.publisher}, and edited by #{mag.editor}."

puts mag.is_a? Magazine
puts mag.is_a? Publication

def mag.wings
  puts "Look! I can fly"
end

mag.wings
