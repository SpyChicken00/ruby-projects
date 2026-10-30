# def stock_picker(prices_array) 
#   max_profit = 0
#   max_profit_days = [nil, nil]
  
#   #find the highest profit combo from sell days after buying 
#   prices_array.each_with_index do |buy_price, buy_day|
#     sell_prices = prices_array[buy_day + 1..prices_array.length - 1] #prices from day AFTER buying
#     sell_prices.each do |sell_price|
#       profit = sell_price - buy_price
#       if (profit > max_profit)
#         #search for index day after buy date then re-add the index day shift
#         #prevents finding sell day before buy day
#         shift = buy_day + 1
#         sell_day = prices_array[shift..].index(sell_price) + shift
#         max_profit_days = [buy_day, sell_day]
#         max_profit = profit
        
#         print "Max Profit: $#{max_profit} "
#         p max_profit_days
#       end
#     end
#   end
#   max_profit_days
# end


# 10-30-26 - The Odin Project
# redo at stock_picker code, O(n) solution instead of
#   overly complicated O(n^2) solution I made before

def stock_picker(prices)
    max_profit = 0
    lowest_day = 0
    lowest_price = prices[0]
    max_profit_days = [nil, nil]

    prices.each_with_index do |current_price, current_day|
      if current_price < lowest_price
        lowest_price = current_price
        lowest_day = current_day;
      end

      potential_profit = current_price - lowest_price
      
      if potential_profit > max_profit 
        max_profit = potential_profit
        max_profit_days = [lowest_day, current_day]
      end
    end

    max_profit_days
end

p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([3,6,9,15,8,6,1,10, 24, 10, 2, 34, 6, 2, 1])
p stock_picker([100, 2, 3, 8, 94, 4, 2, 34, 6]) #highest first
p stock_picker([100, 2, 3, 8, 7, 4, 2, 2, 1]) #highest first, lowest last

