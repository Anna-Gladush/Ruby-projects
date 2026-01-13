def bubble_sort(array)
  save = 0
  return array if array.length <= 1
  
  (array.length-1).times do |index|
    if array[index] > array[index+1]
      save = array[index+1]
      array[index+1] = array[index]
      array[index] = save
    end
  end
  array
end

p bubble_sort([4,3,78,2,0,2])
# [0,2,2,3,4,78]
