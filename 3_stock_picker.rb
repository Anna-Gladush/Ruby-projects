def stock_picker(array)
  # takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

  sell = array[1..-1].max
  sell_idx = array.find_index(sell)
  buy = array[0..sell_idx].min
  buy_idx = array.find_index(buy)
  [buy_idx, sell_idx]

end

p stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12
# 
