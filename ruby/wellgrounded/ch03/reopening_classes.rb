class C
  def x
  end

  def m
    puts "This is the first definition"
  end
end

class C
  def y
  end

  # Overriding methods
  def m
    puts "This would override the previous definition"
  end
end
