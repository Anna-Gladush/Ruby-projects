require 'rainbow'
require_relative 'player'

def round
  puts `clear`
  puts 'Game: Tic Tac Toe, presented by yours truly'
  # Table
  a_row = ' 1 | 2 | 3 '
  c_row = ' 4 | 5 | 6 '
  e_row = ' 7 | 8 | 9 '
  divider = '-----------'
  puts a_row, divider, c_row, divider, e_row

  x_positions = []
  o_positions = []

  player1 = Player.new(x_positions, 'X')
  player2 = Player.new(o_positions, 'O')

  answer = [a_row, c_row, e_row]

  i = 9
  while i >= 1
    puts 'Player 1 turn: '
    answer = player1.turn(answer[0], answer[1], answer[2])
    puts divider, answer[0], divider, answer[1], divider, answer[2]
    i -= 1
    break if player1.win_check? == true

    next if i <= 0

    puts 'Player 2 turn: '
    answer = player2.turn(answer[0], answer[1], answer[2])
    puts divider, answer[0], divider, answer[1], divider, answer[2]
    i -= 1
    break if player2.win_check? == true
  end
end

def ReplaceRainbow(string)
  # correcting rainbow replacing symbols with unreadable strings
  string = string.gsub(" \e[\e[31mX\e[0m1mX\e[0m ", " \e[31mX\e[0m ")
  string = string.gsub(" \e[\e[31mX\e[0m2mO\e[0m ", " \e[32mO\e[0m ")
  string = string.gsub(" \e[3\e[31mX\e[0mmX\e[0m ", " \e[31mX\e[0m ")
  string = string.gsub(" \e[\e[32mO\e[0m1mX\e[0m ", " \e[31mX\e[0m ")
  string.gsub(" \e[3\e[32mO\e[0mmX\e[0m ", " \e[31mX\e[0m ")
end
round
