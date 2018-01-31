print "Input your name: "
name = gets.chomp.capitalize

print "Input your height: "
height = gets.to_i

weight = height - 110

if weight >= 0
  puts "#{name}, your ideal weight is #{weight}"
else
  puts "#{name}, your ideal weight is already optimal!"
end
