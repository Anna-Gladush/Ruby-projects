# Table
a_row = ' 1 | 2 | 3 '
c_row = ' 4 | 5 | 6 '
e_row = ' 7 | 8 | 9 '
divider = '-----------'
puts a_row, divider, c_row, divider, e_row, divider

# used_numbers = []
x_positions = []
o_positions = []
# Функция хода
def turn(symbol_positions, symbol, a_row, c_row, e_row)
  answer = gets.chomp
  if a_row.include?(answer)
    a_row = a_row.gsub(answer, symbol)
  elsif c_row.include?(answer)
    c_row = c_row.gsub(answer, symbol)
  elsif e_row.include?(answer)
    e_row = e_row.gsub(answer, symbol)
  end
  symbol_positions << answer
  [a_row, c_row, e_row]
end
# used_numbers << answer
answer = [' 1 | 2 | 3 ', ' 4 | 5 | 6 ', ' 7 | 8 | 9 ']
i = 9
while i >= 1
  puts 'Player 1 turn: '
  answer = turn(x_positions, 'X', answer[0], answer[1], answer[2])
  puts answer[0], divider, answer[1], divider, answer[2]
  i -= 1

  next if i <= 0

  puts 'Player 2 turn: '
  answer = turn(o_positions, 'O', answer[0], answer[1], answer[2])
  i -= 1
  puts answer[0], divider, answer[1], divider, answer[2]
end
# statements for checking winning conditions
puts 'Player 1 has won' if x_positions.include?([1,2,3]) || x_positions.include?([4,5,6]) || x_positions.include?([7,8,9])
puts 'Player 1 has won' if x_positions.include?([1,4,7]) || x_positions.include?([2,5,8]) || x_positions.include?([3,6,9])
puts 'Player 1 has won' if x_positions.include?([1,5,9]) || x_positions.include?([3,5,7])
puts 'Player 2 has won' if o_positions.include?([1,2,3]) || o_positions.include?([4,5,6]) || o_positions.include?([7,8,9])
puts 'Player 2 has won' if o_positions.include?([1,4,7]) || o_positions.include?([2,5,8]) || o_positions.include?([3,6,9])
puts 'Player 2 has won' if o_positions.include?([1,5,9]) || o_positions.include?([3,5,7])

# puts c.count('O')
# puts `clear` #will clear the output

# class Player
#   def turn
#     answer = gets.chomp
#     while answer >= 1 && answer <= 9
#       used_numbers << answer
#     end
#   end
#   def symbol
#     sym = nil
#     until sym == 'X' || sym == 'O'
#       puts 'Pick "X" or "O"'
#       sym = gets.chomp
#       sym.upcase!
#     end
#     sym
#   end
# end

# player1 = Player.new
# player2 = Player.new
# choice_of_p1 = player1.symbol

# if choice_of_p1 == 'X'
#   choice_of_p2 = 'O'
# else 
#   choice_of_p2 = 'X'
# end