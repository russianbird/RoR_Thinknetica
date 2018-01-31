print "Input your name: "
your_name = gets.chomp.capitalize

print "Input your height: "
height = gets.to_i

weight = height - 110

if weight >= 0
  puts "#{your_name}, your ideal weight is #{weight}"
else
  puts "#{your_name}, your ideal weight is already optimal!"
end
