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
  up_str = up_str.gsub('|3 1|         ', "|3 1|  #{guess[3]} #{guess[2]} #{guess[1]} #{guess[0]}")
  down_str = down_str.gsub('4 3 2 1', "#{guess[3]} #{guess[2]} #{guess[1]} #{guess[0]}")
  up_str = col_peg(up_str)
  [up_str, down_str]
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

def game(up_str, down_str, code, guess)
  feed = feedback(code, guess)
  p feed
  vis = player_turn_visual(up_str, down_str, guess)
  feedback_visual(feed, vis[0], vis[1])
end

# def check_win(feedback)
#   # false true false false
#   break if feedback.all?(true) == true
#   end
# end

a = '|3 1|         '
b = '|4 2|  4 3 2 1'
divider = '---------------'
code = %w[v g y b] # g g y b
puts 'MASTERMIND BOARD: '
puts divider, a, b, divider
i = 9
while i >= 0
  guess = user_guess
  game(a, b, code, guess)
  puts 'You cracked the code! Congratulations!' if feedback(code, guess).all?(true)
  break if feedback(code, guess).all?(true)
end