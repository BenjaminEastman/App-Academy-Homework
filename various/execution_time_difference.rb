
LIST = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# O(n ** 2)
def slow_min(array)
    len = array.length - 1
    sorted = false

    until sorted
      sorted = true
      (0...len).each do |idx|
        if array[idx] > array[idx + 1]
          array[idx], array[idx + 1] = array[idx + 1], array[idx]
          sorted = false
        end
      end
    end

    array[0]
end

p slow_min(LIST) 

# O(n)
def fast_min(array)
    min = array[0]

    array.each do |ele|
        min = ele if ele < min
    end
    min
end

p fast_min(LIST) 

#---------------------------------------------------------------------
LIST2 = [5, 3, -7]
LIST3 = [2, 3, -6, 7, -6, 7]
LIST4 = [-5, -1, -3]


# O(n ** 3)
def slow_sums(array)

    sub_arrays = []
    max = array[0]

    (0...array.length).each do |idx|
        (idx...array.length).each do |edx|
            sub_arrays << array[idx..edx]
        end
    end
    
    sub_arrays.each do |ele|
        max = ele.sum if ele.sum > max
    end
    max

end

p slow_sums(LIST2)
p slow_sums(LIST3)
p slow_sums(LIST4)


def faster_sums(array)
    max_sum = array.first
    current_sum = array.first

    (1...array.length).each do |i|
        current_sum = 0 if current_sum < 0
        current_sum += array[i]
        max_sum = current_sum if current_sum > max_sum
    end


    max_sum
end

p faster_sums(LIST2)
p faster_sums(LIST3)
p faster_sums(LIST4)




