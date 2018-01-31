print "Input your name: "
y_name = gets.chomp.capitalize

print "Input your height: "
height = gets.to_i

weight = height - 110

if weight >= 0
  puts "#{y_name}, your ideal weight is #{weight}"
else
  puts "#{y_name}, your ideal weight is already optimal!"
end
