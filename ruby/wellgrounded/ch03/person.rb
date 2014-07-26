class Person
  def set_name(name)
    puts "Setting person's name..."
    @name = name
  end

  def get_name
    puts "Returning person's name..."
    @name
  end
end

joe = Person.new
joe.set_name("Joe")
puts joe.get_name
