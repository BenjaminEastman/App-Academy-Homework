require "byebug"
# OPTIMIZED
memo = {}

def can_construct?(str, word_bank, memo)
    # debugger
    solution = []
    return memo[str] if memo.has_key?(str)
    return [[]] if str == ""

    word_bank.each do |word|
        if str.start_with?(word)
            answer = can_construct?(str.delete_prefix(word), word_bank, memo) 
            target_ways = answer.map {|ele| ele.insert(0, word)}
            solution = solution + target_ways  
        end
        
    end
    memo[str] = solution # need deep copy in order to memoize, and anyway won't save time in worst case
    return solution
end

p can_construct?("skateboard", ["bo", "rd", "ate", "t", "ska", "sk", "boar"], memo)   #false
memo = {}
p can_construct?("skateboard", ["bo", "d", "ate", "t", "ska", "sk", "boar"], memo)    #true
memo = {}
p can_construct?("doggy", ["y", "d", "og", "o", "g"], memo)                           #true
p memo
memo = {}
p can_construct?("purple", ["purp", "p", "ur", "le", "purpl"], memo)
memo = {}
p can_construct?("doggy", ["d", "o", "g", "b"], memo)                                 #false
memo = {}
p can_construct?("eeeeeeeeeeeeeeeeeeeeeeeeeeef", ["e", "ee", "eee", "eeeeee"], memo)  #false




# ----------------------------------------------
# RECURSIVE, NOT OPTIMIZED

# def can_construct?(str, word_bank)
#     return true if str == ""

#     word_bank.each do |word|
#         answer = can_construct?(str.delete_prefix(word), word_bank) if str.start_with?(word)
#         return answer if answer == true
#     end

#     false
# end
# ----------------------------------------------
