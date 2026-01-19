def stock_picker(array)
  return 'ERROR' if array.length < 2 || (array.length == 2 && array[0] > array[1])
  return [array.find_index(array.min), array.find_index(array.max)] if array.length == 2

  sell_day = 0
  sell_idx = 0
  buy_idx = 0

  # Sell index

  array[1..].each_with_index do |day, i|
    if day >= sell_day
      sell_day = day
      sell_idx = i + 1
    end
  end

  buy_day = sell_day
  buy_day = array[0] if buy_day < array[0]

  # Buy index
  array[0..sell_idx].each_with_index do |day, i|
    if buy_day > day
      buy_day = day
      buy_idx = i
    end
  end
  [buy_idx, sell_idx]
end

# p stock_picker([17,3,6,9,15,8,6,1,10])
# p stock_picker([17])
# p stock_picker([17, 5])
# p stock_picker([9, 2, 2, 2, 1])
# p stock_picker([1, 2, 2, 2, 13])