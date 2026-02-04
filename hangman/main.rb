def random_word
  dictionary = []
  File.open('words.txt', 'r') do |file|
    file.readlines.each do |line|
      dictionary << line
    end
  end
  dictionary.select! { |word| word.length >= 5 && word.length <= 12 }
  dictionary.sample
end

word = random_word # unnecessary
puts word, word.length # 12
guess_word = String.new('_' * word.length)
puts guess_word

try_left = 9

def user_input
  char = 'word'
  # checks if input is a letter and its length is equal to 1.
  ask = 'Please enter your guess (one letter): '
  until char.length == 1 && char.match?(/[A-Za-z]/)
    puts ask
    char = gets.chomp
  end
end
user_input
