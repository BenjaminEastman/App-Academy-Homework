# given target and array of positive integers, can any combo of those integers with each other OR
# with themselves sum to target?
# def can_sum?(target, array)
#     return true if target == 0
#     return false if target < 0

#     array.each do |num|
#         return true if can_sum?(target - num, array) == true
#     end

#     false
# end

# p can_sum?(7, [2, 3])
# p can_sum?(7, [2, 4])
# p can_sum?(8, [2, 3, 5])
# p can_sum?(226, [7, 14])

# memo = {}

# def can_sum_memo?(target, array, memo)
#     return memo[target] if memo[target]
#     return true if target == 0
#     return false if target < 0

#     array.each do |num|
#         if can_sum_memo?(target - num, array, memo) == true
#             memo[target] = true
#             return true
#         end
#     end
#     memo[target] = false
#     false
# end



# p can_sum_memo?(7, [2, 3], memo)
# memo = {}
# p can_sum_memo?(7, [2, 4], memo)
# memo = {}
# p can_sum_memo?(8, [2, 3, 5], memo)
# memo = {}
# p can_sum_memo?(226, [7, 14], memo)

memo = {}

def how_sum?(target, array)
    
    return [] if target == 0
    return nil if target < 0

    array.each do |num|
        holder = how_sum?(target - num, array)
        if !holder.nil?
            holder << num
            return holder
        end
    end
    
    nil
end



# p how_sum?(7, [2, 3])
# memo = {}
# p how_sum?(7, [2, 4])
# memo = {}
# p how_sum?(8, [2, 3, 5])
# memo = {}
# p how_sum?(225, [7, 14])

# memo = {}

# def how_sum_memo?(target, array, memo)
#     return memo[target] if memo.key?(target)
#     return [] if target == 0
#     return nil if target < 0

#     array.each do |num|
#         holder = how_sum_memo?(target - num, array, memo)
#         if !holder.nil?
#             memo[target] = [holder, num]
#             return memo[target].flatten
#         else
#             memo[target] = nil
#         end
#     end
    
#     nil
# end



# p how_sum_memo?(7, [2, 3], memo)
# memo = {}
# p how_sum_memo?(7, [2, 4], memo)
# memo = {}
# p how_sum_memo?(8, [2, 3, 5], memo)
# memo = {}
# p how_sum_memo?(225, [7, 14], memo)


# memo = {}

# def best_sum_memo(target, array, memo)
#     return memo[target] if memo.key?(target)
#     return [] if target == 0
#     return nil if target < 0
#     shortest = nil

#     array.each do |num|
#         holder = best_sum_memo(target - num, array, memo)
#         if !holder.nil?
#             combination = [holder, num].flatten
#             if shortest == nil || combination.length < shortest.length
#                 shortest = combination
#             end
#         end
#     end
#     memo[target] = shortest
#     return shortest
# end

# # m = target
# # n = array.length
# # 



# p best_sum_memo(7, [5, 3, 4, 7], memo)
# memo = {}
# p best_sum_memo(8, [2, 3, 5], memo)
# memo = {}
# p best_sum_memo(8, [1, 4, 5], memo)
# memo = {}
# p best_sum_memo(100, [1, 2, 5, 25], memo)


#TABULATION
def can_sum?(target, array)
    table = Array.new(target + 1, false)
    table[0] = true

    (1..target).each do |idx|
        array.each do |edx|
            if table[idx - edx] == true
                table[idx] = true
            end
        end
    end   
    
    table[target]
        
end
    
p can_sum?(7, [2, 3])
p can_sum?(7, [2, 4])
p can_sum?(0, [2, 3])
p can_sum?(8, [2, 3, 5])
p can_sum?(226, [7, 14])
    


