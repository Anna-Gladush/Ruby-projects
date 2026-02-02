# require 'rainbow'
class Computer

end

class Player

end
# colors: violet, yellow, blue, green - guess
# colors: white, black - feedback
# HOW many guesses are left - counter!
# board
# feedback  guess
# |3 1|  v g y b
# |4 2|  4 3 2 1
# ---------------
# |3 1|
# |4 2|  4 3 2 1
# ---------------
# |3 1|
# |4 2|  4 3 2 1
# ---------------
# |3 1|
# |4 2|  4 3 2 1
# ---------------
# |3 1|
# |4 2|  4 3 2 1
# ---------------
# |3 1|
# |4 2|  4 3 2 1
# ---------------
# |3 1|
# |4 2|  4 3 2 1
# ---------------
# |3 1|
# |4 2|  4 3 2 1
# ---------------
# |3 1|
# |4 2|  4 3 2 1
# ---------------
# |3 1|
# |4 2|  4 3 2 1
# ---------------

# a = "|3 1|         "
# b = "|4 2|  4 3 2 1"
# a = a.gsub("|3 1|         ","|3 1|  v b y g")
# puts a, b

def user_guess
  puts 'Enter v for violet, b for blue, y for yellow, g for green'
  puts 'First slot: '
  first = gets.chomp
  puts 'Second slot: '
  second = gets.chomp
  puts 'Third slot: '
  third = gets.chomp
  puts 'Forth slot: '
  forth = gets.chomp
  [first, second, third, forth]
end
user_guess