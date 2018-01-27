 # Заполнить хеш гласными буквами, где значением будет являтся порядковый
 # номер буквы в алфавите (a - 1).

vowels = %w(a e i o u y)
alph = ('a'..'z').to_a
vow_index = {}

alph.each_with_index do |letter, index|
  vow_index[letter] = index + 1 if vowels.include?(letter)
end

puts vow_index
