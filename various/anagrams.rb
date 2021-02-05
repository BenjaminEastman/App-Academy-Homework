
 

# O(n!) due to permutation
def first_anagram?(word1, word2)
    
    word1.split("").permutation.to_a.include?(word2.split(""))

end

p first_anagram?("threat", "reatht")
p first_anagram?("the", "and")


# O(n^2) 
def second_anagram?(word1, word2)
    word1_arr = word1.split("")
    word2_arr = word2.split("")

    word1_arr.each do |char|
        idx = word2_arr.find_index(char)
        if idx != nil
            word2_arr.slice!(idx)
        end
    end


    word2_arr.empty?
end

p second_anagram?("threat", "reatht")
p second_anagram?("the", "and")


# O(n)
def third_anagram?(word1, word2)

    word1.split("").sort == word2.split("").sort


end

p third_anagram?("threat", "reatht")
p third_anagram?("the", "and")



#O(n)
def fourth_anagram?(word1, word2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    word1.each_char do |char|
        hash1[char] += 1
    end

    word2.each_char do |char|
        hash2[char] += 1
    end

    hash1 == hash2
    
end

p fourth_anagram?("threat", "reatht")
p fourth_anagram?("the", "and")




