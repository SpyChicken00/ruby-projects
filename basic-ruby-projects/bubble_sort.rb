def bubble_sort(array)
  #loop over every element and check if the current element is 
  #the last element will always be sorted so we can gradually go through less of the list
  #
  #
  swaps = 1
  unsorted_length = array.length - 1 ## change name 
  while swaps > 0
    swaps = 0
    unsorted_length -= 1

    array.each_with_index do |num, i|
      next_num = array[i + 1]
      
      break if i > unsorted_length ##last element each iteration will always bubble up at end, redundant check
      if num > next_num
        swaps += 1

        temp = num
        array[i] = next_num
        array[i + 1] = temp  #swap number values. better way to swap in place?
        p array
      end
      
    end
    
    p "swaps: #{swaps}"
  end
  array
end

p bubble_sort([5, 7, 2, 1, 5])
# p bubble_sort([-1,2,3,4,-5,6,7,-8,9])
# p bubble_sort([-1,2,3,0,-5,6,7,-8,9])
# p bubble_sort([1,2,3,4,5,6,7,8,9])
# p bubble_sort([9,8,7,6,5,4,3,2,1])