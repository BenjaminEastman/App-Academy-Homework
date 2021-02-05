
# memo = {}

# def grid_traveler(width, height)
#     return 0 if width == 0 || height == 0
#     return 1 if width == 1 && height == 1

#     grid_traveler(width - 1, height) + grid_traveler(width, height - 1)

# end

# p grid_traveler(1, 1)
# p grid_traveler(3, 3)
# p grid_traveler(0, 8)
# p grid_traveler(14, 14)


# def grid_traveler_memo(width, height, memo)
#     size = [width, height]
#     return memo[size] if memo[size]
#     return 0 if width == 0 || height == 0
#     return 1 if width == 1 && height == 1

#     memo[size] = grid_traveler_memo(width - 1, height, memo) + grid_traveler_memo(width, height - 1, memo)
#     memo[size.reverse] = memo[size]
#     return memo[size]

# end

# p grid_traveler_memo(1, 1, memo)
# p grid_traveler_memo(3, 3, memo)
# p grid_traveler_memo(0, 8, memo)
# p grid_traveler_memo(14, 14, memo)

def grid_traveler(width, height)
    table = Array.new(width + 1) {Array.new(height + 1, 0)}
    
    
    if !(width == 0 || height == 0)
        table[1][1] = 1

        (1..width).each do |idx|
            (1..height).each do |edx|
                if !(idx == 1 && edx == 1)
                    table[idx][edx] = table[idx - 1][edx] + table[idx][edx - 1]
                end
            end
        end
    end
    
    table[width][height]

end

p grid_traveler(1, 1)
p grid_traveler(3, 3)
p grid_traveler(0, 8)
p grid_traveler(14, 14)
