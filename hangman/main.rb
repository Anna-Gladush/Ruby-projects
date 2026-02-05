require json
require_relative 'hangman'

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
  word = random_word
  guess_word = String.new('_' * word.length)
  right_guess = []
  wrong_guess = []
  puts "Word length: #{word.length}"
  puts guess_word
  try_left = 0
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
  end
end

def save
  File.open('progress.json')
end

game