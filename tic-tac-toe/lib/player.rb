# player class
class Player
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def user_input(a_row, c_row, e_row, symbol_positions)
    answer = nil
    until [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(answer)
      puts 'Enter a number from 1 to 9'
      answer = gets.chomp.to_i
    end
    answer_str = answer.to_s
    col_sym = @symbol == 'X' ? Rainbow(symbol).red : Rainbow(symbol).green
    if a_row.include?(answer_str)
      a_row = a_row.gsub(answer_str, col_sym)
    elsif c_row.include?(answer_str)
      c_row = c_row.gsub(answer_str, col_sym)
    elsif e_row.include?(answer_str)
      e_row = e_row.gsub(answer_str, col_sym)
    end
    symbol_positions << answer
    # correcting rainbow replacing symbols with unreadable strings
    a_row = replace_artifacts(a_row)

    [a_row, c_row, e_row]
  end

  def win_check?(symbol_positions)
    player = @symbol == 'X' ? 1 : 2
    win_pos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    win_pos.any? do |arr|
      if arr.all? { |item| symbol_positions.include?(item) }
        puts "Player #{player} has won"
        true
      end
    end
  end

  private

  # correcting rainbow replacing symbols with unreadable strings
  def replace_artifacts(string)
    string = string.gsub(" \e[\e[31mX\e[0m1mX\e[0m ", " \e[31mX\e[0m ")
    string = string.gsub(" \e[\e[31mX\e[0m2mO\e[0m ", " \e[32mO\e[0m ")
    string = string.gsub(" \e[3\e[31mX\e[0mmX\e[0m ", " \e[31mX\e[0m ")
    string = string.gsub(" \e[\e[32mO\e[0m1mX\e[0m ", " \e[31mX\e[0m ")
    string.gsub(" \e[3\e[32mO\e[0mmX\e[0m ", " \e[31mX\e[0m ")
  end
end
