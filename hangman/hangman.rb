# This class draws a hangman
class Hangman
  def level1
    puts ' '
    puts '       |'
    puts '       |'
    puts '       |'
    puts '       |'
    puts '       |'
    puts '========='
  end

  def level2
    puts '   +---+'
    puts '       |'
    puts '       |'
    puts '       |'
    puts '       |'
    puts '       |'
    puts '========='
  end

  def level3
    puts '   +---+'
    puts '   |   |'
    puts '       |'
    puts '       |'
    puts '       |'
    puts '       |'
    puts '========='
  end

  def level4
    puts '   +---+'
    puts '   |   |'
    puts '   0   |'
    puts '       |'
    puts '       |'
    puts '       |'
    puts '========='
  end

  def level5
    puts '   +---+'
    puts '   |   |'
    puts '   0   |'
    puts '   |   |'
    puts '       |'
    puts '       |'
    puts '========='
  end

  def level6
    puts '   +---+'
    puts '   |   |'
    puts '   0   |'
    puts '   |\  |'
    puts '       |'
    puts '       |'
    puts '========='
  end

  def level7
    puts '   +---+'
    puts '   |   |'
    puts '   0   |'
    puts '  /|\  |'
    puts '       |'
    puts '       |'
    puts '========='
  end

  def level8
    puts '   +---+'
    puts '   |   |'
    puts '   0   |'
    puts '  /|\  |'
    puts '    \  |'
    puts '       |'
    puts '========='
  end

  def gameover
    puts '   +---+'
    puts '   |   |'
    puts '   0   |'
    puts '  /|\  |'
    puts '  / \  |'
    puts '       |'
    puts '========='
  end
end

def hangman(num)
  hang = Hangman.new
  case num
  when 1
    hang.level1
  when 2
    hang.level2
  when 3
    hang.level3
  when 4
    hang.level4
  when 5
    hang.level5
  when 6
    hang.level6
  when 7
    hang.level7
  when 8
    hang.level8
  when 9
    hang.gameover
  end
end
# hang = Hangman.new
# hang.level1
# hang.level2
# hang.level3
# hang.level4
# hang.level5
# hang.level6
# hang.level7
# hang.level8
# hang.gameover
