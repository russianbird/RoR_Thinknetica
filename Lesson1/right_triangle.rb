# Программа запрашивает у пользователя 3 стороны треугольника и определяет, является ли треугольник 
# прямоугольным, используя теорему Пифагора (www-formula.ru) и выводит результат на экран. Также, если 
# треугольник является при этом равнобедренным (т.е. у него равны любые 2 стороны), то дополнительно 
# выводится информация о том, что треугольник еще и равнобедренный. Подсказка: чтобы воспользоваться 
# теоремой Пифагора, нужно сначала найти самую длинную сторону (гипотенуза) и сравнить ее значение в 
# квадрате с суммой квадратов двух остальных сторон. Если все 3 стороны равны, то треугольник 
# равнобедренный и равносторонний, но не прямоугольный.

print "Input A: "
a = gets.to_i
print "Input B: "
b = gets.to_i
print "Input C: "
c = gets.to_i

if a == b && b == c 
	puts "This triangle is equilateral and isosceles, but not right-angled!"
	exit
end

arr = [a, b, c].sort

if arr[1] == arr[2]
	puts "This triangle is isosceles, but not right-angled!"
	exit
else
cat1 = arr[0]
cat2 = arr[1]
hypo = arr[2]
end

if cat1 == cat2 && hypo**2 == cat1**2 + cat2**2
	puts "This triangle is isosceles and right-angled!"
elsif cat1 == cat2 
	puts "This triangle is isosceles, but not right-angled!"
elsif hypo**2 == cat1**2 + cat2**2
	puts "This triangle is right-angled!"
else
	puts "This triangle is not right-angled!"
end
