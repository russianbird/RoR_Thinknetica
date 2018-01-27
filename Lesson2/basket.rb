# Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного
# товара (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор,
# пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный
# хеш, содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за
# каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".

basket = {}
total = 0

loop do
  print "Input item: "
  item = gets.chomp.downcase
  break if item == "stop"
  print "Input cost: "
  cost = gets.to_f
  print "Input amount: "
  amount = gets.to_f
  basket[item] = {cost: cost, amount: amount}
end


basket.each do |product, value|
  puts "#{product}:  " + "#{value[:cost]}  " + "#{value[:amount]}  " + "#{value[:cost] * value[:amount]}"
  total += value[:cost] * value[:amount]
end

puts total
