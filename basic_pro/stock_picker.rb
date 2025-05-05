def stock_picker(tarr)
  best_price = 0
  dayS = 0
  dayB = 0

  tarr.each_with_index do |val1, idx1|
    tarr.each_with_index do |val2, idx2|
      if idx2 > idx1 && (val2 - val1) > best_price
        best_price = val2 - val1
        dayB = idx1
        dayS = idx2
      end
    end
  end

  puts "The best day to buy is #{dayB} and sell is #{dayS}, profit = #{best_price}"
end
tarr=[17,3,6,9,15,8,6,1,10]
stock_picker(tarr)