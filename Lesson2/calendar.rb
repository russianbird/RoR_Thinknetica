# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным
print "Input date: "
day = gets.to_i
print "Input month: "
month = gets.to_i
print "Input year: "
year = gets.to_i

year_init = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
year_init[1] = 29 if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0

my_year = year_init.first(month - 1)
my_date = day + my_year.inject(0) { |sum, date| sum + date }

puts my_date
