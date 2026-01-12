def stock_picker(array)
  # takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
  return "ERROR" if array.length < 2

  

  # sell_item = (array[1..-1].sort)[-1]
  # p sell_idx = array.find_index(sell_item)
  # p buy_item = array[0..sell_idx].sort[0]
  # buy_idx = array.find_index(buy_item)
  # [buy_idx, sell_idx]


  # sell = array[1..-1].max
  # sell_idx = array.find_index(sell)
  # buy = array[0..sell_idx].min
  # buy_idx = array.find_index(buy)
  
  # [buy_idx, sell_idx]

end

p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([17])
p stock_picker([9, 2, 2, 2, 1])
p stock_picker([1, 2, 2, 2, 13])
# => [1,4]  # for a profit of $15 - $3 == $12
# 
