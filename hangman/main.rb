require 'json'
require_relative 'hangman'

def save_progress(word, guess_word, try, wrong, right)
  puts 'Do you want to save progress? (Y/N)'
  progress = {
    word: word,
    guess_word: guess_word,
    try_left: try,
    wrong_guess: wrong,
    right_guess: right
  }
  prog = nil
  prog = gets.chomp.downcase until %w[y yes n no].include?(prog)
  File.write('progress.json', JSON.pretty_generate(progress)) if %w[y yes].include?(prog)
end

def receive_progress
  data = JSON.load_file('progress.json')
  [data['word'], data['guess_word'], data['try_left'], data['wrong_guess'], data['right_guess']]
end

def load
  load = nil
  puts 'Would you like to load previous game? (Y/N)'
  load = gets.chomp.downcase until %w[y yes n no].include?(load)
  if %w[y yes].include?(load)
    receive_progress
  else
    default
  end
end

def default
  word = random_word
  guess_word = String.new('_' * word.length)
  try_left = 0
  wrong_guess = []
  right_guess = []
  [word, guess_word, try_left, wrong_guess, right_guess]
end

def find_index(str, letter)
  idx = []
  str_arr = str.split('')
  str_arr.each_with_index { |char, i| idx << i if char == letter }
  idx
end

def random_word
  dictionary = []
  File.open('words.txt', 'r') do |file|
    file.readlines.each do |line|
      word = line.chomp
      dictionary << word if word.length >= 5 && word.length <= 12
    end
  end
  dictionary.sample
end

def user_input
  char = 'word'
  ask = 'Please enter your guess (one letter): '
  until char.length == 1 && char.match?(/[A-Za-z]/)
    puts ask
    char = gets.chomp
  end
  char
end

def game
  game_info = load
  puts `clear`
  word = game_info[0]
  guess_word = game_info[1]
  try_left = game_info[2]
  wrong_guess = game_info[3]
  right_guess = game_info[4]
  puts "Word length: #{word.length}"
  puts guess_word
  while try_left <= 9
    if word == guess_word
      puts `clear`
      puts 'You won!'
    end
    if try_left == 9
      puts `clear`
      hangman(9)
      puts 'You lost!'
    end
    break if word == guess_word || try_left == 9

    guess = user_input
    puts `clear`
    if word.include?(guess) == true
      idx = find_index(word, guess)
      idx.each { |i| guess_word[i] = guess }
      right_guess << guess
    else
      wrong_guess << guess
      try_left += 1
    end
    hangman(try_left + 1)
    puts guess_word
    puts "Word length: #{word.length}"
    print "Wrong guesses: #{wrong_guess.join(', ')}\nMistakes left: #{9 - try_left}\n"
    print "Right guesses: #{right_guess.join(', ')}\n"
    save_progress(word, guess_word, try_left, wrong_guess, right_guess)
  end
end

# save_progress('unnecessary', 'u__ecessary', 3, ["f", "o", "d", "k", "m", "l"], ["u", "e", "c", "s", "a", "r", "y"])
# receive_progress
game
# load
# p default
