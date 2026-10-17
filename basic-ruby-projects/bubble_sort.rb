def bubble_sort(array)
  #loop over every element and check if the current element is 
  #the last element will always be sorted so we can gradually go through less of the list
  #
  #
  swaps = 1
  # stop_index = array.length - 1
  while swaps > 0
    swaps = 0
    array.each_with_index do |num, i|
      p array
      p num
      next_num = array[i + 1]
      p next_num
      break if next_num == nil #or find way to check if last index
      if num > next_num
        swaps += 1
        temp = num
        array[i] = next_num
        array[i + 1] = temp  #swap number values 
      end
      p num
      p next_num
      p array
    end
    
    p "swaps: #{swaps}"
    p array
  end
  array
end

p bubble_sort([5, 7, 2, 1, 5])
# p bubble_sort([-1,2,3,4,-5,6,7,-8,9])
# p bubble_sort([-1,2,3,0,-5,6,7,-8,9])
# p bubble_sort([1,2,3,4,5,6,7,8,9])
# p bubble_sort([9,8,7,6,5,4,3,2,1])