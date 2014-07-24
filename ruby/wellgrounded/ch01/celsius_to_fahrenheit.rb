data_file = "temp.in"
puts "Reading Celsius temperature from data file " + data_file
num = File.read(data_file)
celsius = num.to_i
fahrenheit = (celsius * 9 / 5) + 32
puts "The celsius is " + celsius.to_s + " and fahrenheit is " + fahrenheit.to_s
output_file = "temp.out"
puts "Saving result to " + output_file
fh = File.new(output_file, "w")
fh.puts fahrenheit
fh.close
