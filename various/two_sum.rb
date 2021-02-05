

# O(n^2)
def bad_two_sum?(array, target_sum)

    (0...array.length).each do |idx|
        (idx + 1...array.length).each do |edx|
            return true if array[idx] + array[edx] == target_sum
        end
    end
    false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false




#O(n log n)
def okay_two_sum?(array, target_sum)
    sorted = array.sort  #O(logn) (But isn't worst case here O(n^2)?)
    i, j = 0, array.length - 1

    while i < j #O(n)
        case (array[i] + array[j]) <=> target_sum
        when 0
            return true
        when -1
            i += 1
        when 1
            j -= 1
        end
    end
    false
end



# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

# O(n)
def two_sum?(array, target_sum)
    checked = {}

    array.each_with_index do |ele, i|
        return true if checked[target_sum - ele]
        checked[ele] = i
    end
    false

end



#O(n) linear time
#O(n) linear space

# This can be easily adapted to also return the indices of the two numbers:
  
def two_sum_indices(arr, target_sum)
    complements = {}
    arr.each_with_index do |el, i|
      complement, j = complements[target_sum - el] # these will both be nil if the complement doesn't exist
      return [i, j] if complement
  
      complements[el] = [el, i]
    end
    nil
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false