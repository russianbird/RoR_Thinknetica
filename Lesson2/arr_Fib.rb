# Заполнить массив числами фибоначчи до 100

arr = [0, 1, 1]

while (i = arr[-1] + arr[-2]) < 100
  arr << i
end

puts arr
