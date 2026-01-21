# Table
a_row = ' 1 | 2 | 3 '
b_row = '-----------'
c_row = ' 4 | 5 | 6 '
d_row = '-----------'
e_row = ' 7 | 8 | 9 '
f_row = '-----------'
puts a_row, b_row, c_row, d_row, e_row, f_row

used_numbers = []
x_positions = []
o_positions = []

i = 9
while i >= 1
  puts 'Player 1 turn: '
  answer = gets.chomp
  if a_row.include?(answer)
    a_row = a_row.gsub(answer, 'X')
  elsif c_row.include?(answer)
    c_row = c_row.gsub(answer, 'X')
  elsif e_row.include?(answer)
    e_row = e_row.gsub(answer, 'X')
  end
  used_numbers << answer
  x_positions << answer
  puts a_row, b_row, c_row, d_row, e_row, f_row
  i -= 1

  puts 'Player 2 turn: '
  answer = gets.chomp
  if a_row.include?(answer)
    a_row = a_row.gsub(answer, 'O')
  elsif c_row.include?(answer)
    c_row = c_row.gsub(answer, 'O')
  elsif e_row.include?(answer)
    e_row = e_row.gsub(answer, 'O')
  end
  used_numbers << answer
  o_positions << answer
  puts a_row, b_row, c_row, d_row, e_row, f_row
  i -= 1
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