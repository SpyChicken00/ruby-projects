def stock_picker(prices_array) 
  #loop from first value to end
  #loop must stop when on last two
  
  max_profit = 0
  max_profit_days = [nil, nil]
  
  prices_array.each_with_index do |buy_price, buy_day|
    sell_prices = prices_array[buy_day + 1..prices_array.length - 1]
    p sell_prices
    break if sell_prices.length <= 1
    sell_prices.each do |sell_price|
      profit = sell_price - buy_price
      if (profit > max_profit)
        max_profit = profit
        sell_day = prices_array[(buy_day + 1)..].index(sell_price) + (buy_day + 1)
        max_profit_days = [buy_day, sell_day]
        
        p prices_array
        print "Max Profit: $#{max_profit} "
        p max_profit_days
      end
      ###TODO FIND BETTER WAY TO GO THROUGH SELL DATES, code is ambiguous
    end
  end
  max_profit_days
end

p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([3,6,9,15,8,6,1,10, 24, 10, 2, 34, 6, 2, 1])
#p stock_picker([100, 2, 3, 8, 94, 4, 2, 34, 6]) #highest first
#p stock_picker([100, 2, 3, 8, 7, 4, 2, 2, 1]) #highest first, lowest last
#Pay attention to edge cases like when the lowest day 
#is the last day or the highest day is the first day
