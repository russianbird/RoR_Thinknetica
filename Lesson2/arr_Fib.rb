# Заполнить массив числами фибоначчи до 100

arr = [0, 1, 1]

i = 0

loop do 
  i = arr[-1] + arr[-2]
  break if i > 100
  arr << i
end

puts arr