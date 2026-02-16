require 'rainbow'
require_relative 'player'

# tic tac toe game
class Game
  def initialize
    @a_row = ' 1 | 2 | 3 '
    @c_row = ' 4 | 5 | 6 '
    @e_row = ' 7 | 8 | 9 '
    @divider = '-----------'
    @x_positions = []
    @o_positions = []
  end

  def game(player1, player2)
    introduction
    answer = [@a_row, @c_row, @e_row]
    i = 9
    while i >= 1
      puts 'Player 1 turn: '
      answer = turn_answer_display(player1, answer, @x_positions)
      i -= 1
      break if player1.win_check?(@x_positions) == true

      next if i <= 0

      puts 'Player 2 turn: '
      answer = turn_answer_display(player2, answer, @o_positions)
      i -= 1
      break if player2.win_check?(@o_positions) == true
    end
  end

  def turn_answer_display(player, answer, symbol_positions)
    answer = player.user_input(answer[0], answer[1], answer[2], symbol_positions)
    puts @divider, answer[0], @divider, answer[1], @divider, answer[2]
    answer
  end

  private

  def introduction
    puts `clear`
    puts 'Game: Tic Tac Toe, presented by yours truly'
    puts @a_row, @divider, @c_row, @divider, @e_row
  end
end
