require 'rainbow'
module Essentials
  def all_solutions
    arr = %w[g v b y]
    master_array = arr.product(arr, arr, arr)
    master_array.select { |arr| arr.length == 4 && check_count?(arr) == true }
  end

  def col_peg(str)
    peg = "\u2022"
    str = str.gsub('v', Rainbow(peg).magenta)
    str = str.gsub('b', Rainbow(peg).cyan)
    str = str.gsub('y', Rainbow(peg).yellow)
    str.gsub('g', Rainbow(peg).webgreen)
  end

  def check_col_peg(str)
    peg = "\u2022"
    str = str.gsub('false', Rainbow(peg).white)
    str.gsub('true', Rainbow(peg).red)
  end
end

class Board
  include Essentials

  def board(up_str, down_str)
    divider = '---------------'
    puts 'MASTERMIND BOARD: '
    puts divider, up_str, down_str, divider
  end

  def turn_visual(up_str, down_str, guess)
    up_str = up_str.gsub('|3 1|         ', "|3 1|  #{guess[3]} #{guess[2]} #{guess[1]} #{guess[0]}")
    down_str = down_str.gsub('4 3 2 1', "#{guess[3]} #{guess[2]} #{guess[1]} #{guess[0]}")
    up_str = col_peg(up_str)
    [up_str, down_str]
  end

  def feedback(code, guess)
    feedback = []
    code.each_with_index do |val, idx|
      feedback << (val == guess[idx])
    end
    feedback
  end

  def feedback_visual(feedback, up_str, down_str)
    up_str = up_str.gsub('3 1', "#{feedback[2]} #{feedback[0]}")
    down_str = down_str.gsub('4 2', "#{feedback[3]} #{feedback[1]}")
    up_str = check_col_peg(up_str)
    down_str = check_col_peg(down_str)
    puts up_str, down_str
  end

  def turn(up_str, down_str, code, guess)
    feed = feedback(code, guess)
    vis = turn_visual(up_str, down_str, guess)
    feedback_visual(feed, vis[0], vis[1])
  end

  def check_count?(arr)
    if arr.count('b') >= 2 || arr.count('v') >= 2 || arr.count('y') >= 2 || arr.count('g') >= 2
      false
    else
      true
    end
  end

  def game(cipher)
    player = Player.new
    a = '|3 1|         '
    b = '|4 2|  4 3 2 1'
    code = cipher
    puts `clear`
    board(a, b)
    i = 9
    while i >= 0
      puts 'You lost' if i.zero?
      break if i.zero?

      guess = player.user_guess
      turn(a, b, code, guess)
      i -= 1
      puts 'You cracked the code! Congratulations!' if feedback(code, guess).all?(true)
      break if feedback(code, guess).all?(true)
    end
  end

  def mode
    puts 'Do you want to play Player vs Player? or Player vs Computer?'
    mode = nil
    until %w[a b].include?(mode)
      puts 'Please enter: '
      puts 'a) PvP      b) PvC'
      mode = gets.chomp
    end
    if mode == 'a'
      player = Player.new
      game(player.player_code)
    else
      computer = Computer.new
      computer.computer_game
    end
  end
end

class Computer
  def computer_turn(player_code)
    board = Board.new
    a = '|3 1|         '
    b = '|4 2|  4 3 2 1'
    puts `clear`
    board.board(a, b)
    initial_guess = %w[v v v v]
    guess = computer_guess(initial_guess, a, b, player_code, 'y')
    guess = computer_guess(guess, a, b, player_code, 'b')
    guess = computer_guess(guess, a, b, player_code, 'g')
    board.turn(a, b, player_code, guess)
    puts 'Computer cracked the code!' if board.feedback(player_code, guess).all?(true)
  end

  def computer_game
    puts 'Who will be the codebreaker?'
    mode = nil
    until %w[a b].include?(mode)
      puts 'Please enter: '
      puts 'a) Player      b) Computer'
      mode = gets.chomp
    end
    if mode == 'a'
      board = Board.new
      board.game(computer_code)
    else
      player = Player.new
      computer_turn(player.player_code)
    end
  end

  def computer_code
    board = Board.new
    board.all_solutions.sample
  end

  def computer_guess(guess, a, b, player_code, sym)
    board = Board.new
    board.turn(a, b, player_code, guess)
    feed = board.feedback(player_code, guess)
    feed = feed.map.with_index { |val, idx| val == false ? nil : guess[idx] }
    guess = feed.map { |x| x.nil? ? sym : x }
  end
end

class Player
  def user_guess
    arr = Array.new(4)
    puts 'Enter v for violet, b for blue, y for yellow, g for green'
    puts 'First slot: '
    arr[0] = gets.chomp until %w[v g y b].include?(arr[0])
    puts 'Second slot: '
    arr[1] = gets.chomp until %w[v g y b].include?(arr[1])
    puts 'Third slot: '
    arr[2] = gets.chomp until %w[v g y b].include?(arr[2])
    puts 'Forth slot: '
    arr[3] = gets.chomp until %w[v g y b].include?(arr[3])
    arr
  end

  def player_code
    puts 'Enter v for violet, b for blue, y for yellow, g for green'
    puts 'Your code: '
    code = []
    4.times do
      answer = nil
      answer = gets.chomp until %w[v g y b].include?(answer)
      code << answer
    end
    code
  end
end

board = Board.new
board.mode
