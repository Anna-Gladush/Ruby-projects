def bubble_sort(array)
  save = 0
  return array if array.length <= 1

  (array.length - 1).times do
    (array.length - 1).times do |index|
      if array[index] > array[index + 1]
        save = array[index + 1]
        array[index + 1] = array[index]
        array[index] = save
      end
    end
  end
  array
end

p bubble_sort([4,3,78,2,0,2])
p bubble_sort([4,3,78,2,0,2,100,1,3,5,3,6,0,9])
