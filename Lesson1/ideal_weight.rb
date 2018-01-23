# Программа запрашивает у пользователя имя и рост и выводит идеальный вес по формуле <рост> - 110, 
# после чего выводит результат пользователю на экран с обращением по имени. Если идеальный вес получается 
# отрицательным, то выводится строка "Ваш вес уже оптимальный"


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
