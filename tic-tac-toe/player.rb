class Player
  attr_reader :symbol
  def initialize(symbol_positions, symbol)
    @symbol_positions = symbol_positions
    @symbol = symbol
  end

  def turn(a_row, c_row, e_row)
    answer = gets.chomp.to_i
    answer_str = answer.to_s
    col_sym = @symbol == 'X' ? Rainbow(symbol).red : Rainbow(symbol).green
    if a_row.include?(answer_str)
      a_row = a_row.gsub(answer_str, col_sym)
    elsif c_row.include?(answer_str)
      c_row = c_row.gsub(answer_str, col_sym)
    elsif e_row.include?(answer_str)
      e_row = e_row.gsub(answer_str, col_sym)
    end
    @symbol_positions << answer
    a_row = a_row.gsub(" \e[\e[31mX\e[0m1mX\e[0m ", " \e[31mX\e[0m ")
    a_row = a_row.gsub(" \e[\e[31mX\e[0m2mO\e[0m ", " \e[32mO\e[0m ")
    a_row = a_row.gsub(" \e[3\e[31mX\e[0mmX\e[0m ", " \e[31mX\e[0m ")
    a_row = a_row.gsub(" \e[\e[32mO\e[0m1mX\e[0m ", " \e[31mX\e[0m ")
    a_row = a_row.gsub(" \e[3\e[32mO\e[0mmX\e[0m ", " \e[31mX\e[0m ")

    [a_row, c_row, e_row]
  end

  def win_check?
    player = @symbol == 'X' ? 1 : 2
    win_pos = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
    win_pos.any? do |arr|
      if arr.all? { |item| @symbol_positions.include?(item) }
        puts "Player #{player} has won"
        true
      end
    end
  end
end
