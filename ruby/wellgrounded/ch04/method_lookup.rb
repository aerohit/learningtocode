module M
  def report
    puts "'report' method in module M"
  end
end

module N
  def report
    puts "'report' method in module N"
  end
end

module MeFirst
  def report
    puts "'report' method in module MeFirst"
  end
end

class C
  prepend MeFirst
  include M
  include N
  def report
    puts "'report' method in class C"
    super
  end
end

class D < C
end

obj = D.new
obj.report
puts D.ancestors
