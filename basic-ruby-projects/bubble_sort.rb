#go through list in order repeatedly and swap elements 
#if left is bigger than right, if no swaps then list is sorted
def bubble_sort(array)
  swaps = 1
  unsorted_length = array.length - 1 ## change name 

  while swaps > 0
    swaps = 0
    unsorted_length -= 1
    array.each_with_index do |num, i|
      ##last element each iteration will always bubble up at end, redundant check
      break if i > unsorted_length 
  
      next_num = array[i + 1]
      if num > next_num
        swaps += 1
        array[i], array[i+1] = array[i+1], array[i]
        # p array
      end
    end
    # p "swaps: #{swaps}"
  end
  array
end

p bubble_sort([5, 7, 2, 1, 5])
# p bubble_sort([-1,2,3,4,-5,6,7,-8,9])
# p bubble_sort([-1,2,3,0,-5,6,7,-8,9])
# p bubble_sort([1,2,3,4,5,6,7,8,9])
# p bubble_sort([9,8,7,6,5,4,3,2,1])