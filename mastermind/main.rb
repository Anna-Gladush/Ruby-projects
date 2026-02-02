require 'rainbow'
class Computer

end

class Player

end

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

def player_turn_visual(up_str, down_str, guess)
  peg = "\u2022"
  up_str = up_str.gsub('|3 1|         ', "|3 1|  #{guess[3]} #{guess[2]} #{guess[1]} #{guess[0]}")
  down_str = down_str.gsub('4 3 2 1', "#{guess[3]} #{guess[2]} #{guess[1]} #{guess[0]}")
  up_str = up_str.gsub('v', Rainbow(peg).magenta)
  up_str = up_str.gsub('b', Rainbow(peg).cyan)
  up_str = up_str.gsub('y', Rainbow(peg).yellow)
  up_str = up_str.gsub('g', Rainbow(peg).webgreen)
  [up_str, down_str]
end

def check_col_peg(str)
  peg = "\u2022"
  str = str.gsub('false', Rainbow(peg).white)
  str.gsub('true', Rainbow(peg).red)
end

def feedback(code, guess)
  feedback = []
  code.each_with_index do |val, idx|
    feedback << (val == guess[idx]) # false true false false
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

def game
  a = '|3 1|         '
  b = '|4 2|  4 3 2 1'
  code = %w[v g y b] # g g y b
  guess = user_guess
  feed = feedback(code, guess)
  vis = player_turn_visual(a, b, guess)
  feedback_visual(feed, vis[0], vis[1])
end
game