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
