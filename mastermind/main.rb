require 'rainbow'
class Computer

end

class Player

end
# colors: violet, yellow, blue, green - guess
# colors: white, black - feedback
# HOW many guesses are left - counter! (10?)
# board
# feedback  guess
# |3 1|  v g y b
# |4 2|  4 3 2 1
# ---------------
# |3 1|
# |4 2|  4 3 2 1
# ---------------

def user_guess
  # Add check for valid input
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

# pegs
# Rainbow(peg).magenta
# Rainbow(peg).green
# Rainbow(peg).yellow
# Rainbow(peg).cyan

def player_turn_visual
  peg = "\u2022"
  guess = user_guess
  a = '|3 1|         '
  b = '|4 2|  4 3 2 1'
  a = a.gsub('|3 1|         ', "|3 1|  #{guess[3]} #{guess[2]} #{guess[1]} #{guess[0]}")
  b = b.gsub('4 3 2 1', "#{guess[3]} #{guess[2]} #{guess[1]} #{guess[0]}")
  a = a.gsub('v', Rainbow(peg).magenta)
  a = a.gsub('b', Rainbow(peg).cyan)
  a = a.gsub('y', Rainbow(peg).yellow)
  a = a.gsub('g', Rainbow(peg).webgreen)
  puts a, b
end

# def check(code)
#   guess = user_guess
#   %w[v g y b].include?(user_guess)
# end

def check_col_peg(str)
  peg = "\u2022"
  str = str.gsub('false', Rainbow(peg).white)
  str.gsub('true', Rainbow(peg).red)
end

def feedback
  code = %w[v g y b]
  guess = %w[b v y g]
  feedback = []
  code.each_with_index do |val, idx|
    feedback << (val == guess[idx]) # false false true false
  end
  p feedback.reverse! # false true false false
end

def feedback_visual(feedback)
  a = '|3 1|         '
  b = '|4 2|  4 3 2 1'
  a = a.gsub('3 1', "#{feedback[2]} #{feedback[0]}")
  b = b.gsub('4 2', "#{feedback[3]} #{feedback[1]}")
  a = check_col_peg(a)
  b = check_col_peg(b)
  puts a, b
end