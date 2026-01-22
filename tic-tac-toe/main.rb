# Table
a_row = ' 1 | 2 | 3 '
c_row = ' 4 | 5 | 6 '
e_row = ' 7 | 8 | 9 '
divider = '-----------'
puts a_row, divider, c_row, divider, e_row

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

# statements for checking winning conditions
def win_check(symbol_positions, symbol)
  player = symbol == 'X' ? 1 : 2
  if symbol_positions.all?([1, 2, 3]) || symbol_positions.all?([4, 5, 6]) || symbol_positions.all?([7, 8, 9])
    puts "Player #{player} has won"
    'yes'
  elsif symbol_positions.all?([1, 4, 7]) || symbol_positions.all?([2, 5, 8]) || symbol_positions.all?([3, 6, 9])
    puts "Player #{player} has won"
    'yes'
  elsif symbol_positions.all?([1, 5, 9]) || symbol_positions.all?([3, 5, 7])
    puts "Player #{player} has won"
    'yes'
  end
end

answer = [' 1 | 2 | 3 ', ' 4 | 5 | 6 ', ' 7 | 8 | 9 ']
i = 9
while i >= 1
  puts 'Player 1 turn: '
  answer = turn(x_positions, 'X', answer[0], answer[1], answer[2])
  puts answer[0], divider, answer[1], divider, answer[2]
  i -= 1
  break if win_check(x_positions, 'X') == 'yes'

  puts x_positions

  next if i <= 0

  puts 'Player 2 turn: '
  answer = turn(o_positions, 'O', answer[0], answer[1], answer[2])
  i -= 1
  puts answer[0], divider, answer[1], divider, answer[2]
  break if win_check(o_positions, 'O') == 'yes'

  puts o_positions
end

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