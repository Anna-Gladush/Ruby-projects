def substrings(string, dictionary)
  result = Hash.new(0)
  word_list = []
  combinations_storage = []
  substring_storage = []

  # Makes an array for substrings
  sentence = string.downcase.split(' ')
  sentence.each do |word| # ["howdy", "partner,", "sit", "down!", "how's", "it", "going?"]
    word_list << word.split('').select { |letter| (letter != ' ') && (letter != '!') && (letter != '?') && (letter != ',') && (letter != '.') && (letter != "'") }
  end
  word_list.each { |word| word.each_with_index { |_, idx| combinations_storage << word.combination(idx + 1).to_a } }
  combinations_storage.each { |arr| arr.each { |array| substring_storage << array.join } }

  # Checks if substring in substring_storage is in dictionary
  dictionary.each do |word|
    substring_storage.each do |substring|
      result[word] += 1 if word == substring
    end
  end
  result
end
# dictionary = ['below', 'down', 'go', 'going', 'horn', 'how', 'howdy', 'it', 'i', 'low', 'own', 'part', 'partner', 'sit']
# p substrings('below', dictionary)
# p substrings("Howdy partner, sit down! How's it going?", dictionary)
