# Заполнить массив числами от 10 до 100 с шагом 5

arr = []

i = 5

loop do 
  i += 5
  arr << i
  break if i >= 100
end

puts arr
