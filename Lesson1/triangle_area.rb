# Площадь треугольника можно вычилсить, зная его основание (a) и высоту (h) по формуле: 1/2*a*h. 
# Программа должна запрашивать основание и высоту треуголиника и возвращать его площадь.

print "What's the base of your triangle? "
a = gets.to_f

print "What's the height of your triangle? "
h = gets.to_f

s = (0.5 * a * h)

puts "The area of your triangle is #{s}."
