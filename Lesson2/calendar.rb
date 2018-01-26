# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным
print "Input date: "
d = gets.to_i
print "Input month: "
m = gets.to_i - 1
print "Input year: "
y = gets.to_i

year = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
year[1] = 29 if y % 4 == 0 && y % 100 != 0 || y % 400 == 0

my_year = year.first(m)
my_date = d + my_year.inject(0) { |sum, day| sum + day }

puts my_date
