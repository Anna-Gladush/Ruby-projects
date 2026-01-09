def caesar_cipher(string, step = 1)
  # You will need to remember how to convert a string into a number.
  # Don’t forget to wrap from z to a.
  # Don’t forget to keep the same case.
  # The Wikipedia quote discusses a Caesar cipher using a left shift.
  
  str_array = string.split.to_a
  new_words = []
  result = []
  str_array.each do |words|
    deciphered_letter = []
    word = words.split("")
    word.each do |letter|
      if (letter.ord + step) > 90 && (65 <= letter.ord && letter.ord <= 90)
        letter_shifted = 65 + letter.ord + (step - 1) - 90
        deciphered_letter.push((letter_shifted.ord).chr)
      elsif (letter.ord + step) > 122 && (97 <= letter.ord && letter.ord <= 122)
        letter_shifted = 97 + letter.ord + (step - 1) - 122
        deciphered_letter.push((letter_shifted.ord).chr)
      elsif (65 <= letter.ord && letter.ord <= 90) || (97 <= letter.ord && letter.ord <= 122)
        deciphered_letter.push((letter.ord + step).chr) 
      else
        deciphered_letter.push(letter)
      end
    end
    new_words.push(deciphered_letter, " ")
  end
  new_words.each do |words|
    if words.respond_to?(:to_a)
      result.push(words.join)
    else
      result.push(words)
    end
  end
  result.pop
  result.join
end

def caesar_decipher(string, step)
  # Don’t forget to wrap from z to a.
  # Don’t forget to keep the same case.
  
end
p caesar_cipher("Zorro!")
p caesar_cipher("What a string!", 5)
# caesar_cipher("What a string!", 5)
# caesar_decipher("Bmfy f xywnsl!", 5)