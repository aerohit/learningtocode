class SomeClass
  attr_reader   :readable_attribute
  attr_writer   :writable_attribute
  attr_accessor :accessible_attribute
end

some_obj = SomeClass.new

some_obj.writable_attribute   = 5
some_obj.accessible_attribute = 7

p some_obj.readable_attribute
p some_obj.accessible_attribute
