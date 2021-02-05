
FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# def sluggish_octopus(fish)
#     longest = fish[1]
    
#     fish.each do |ele|
#         fish.each do |el|
#             longest = el if ele.length < el.length
#         end
#     end
#     longest

# end


def sluggish_octopus(array)
    len = array.length - 1
    sorted = false

    until sorted
      sorted = true
      (0...len).each do |idx|
        if array[idx].length > array[idx + 1].length
          array[idx], array[idx + 1] = array[idx + 1], array[idx]
          sorted = false
        end
      end
    end

    array[-1]
  end

p sluggish_octopus(FISH)

def dominant_octopus (array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
      dominant_octopus(array.take(mid_idx), &prc),
      dominant_octopus(array.drop(mid_idx), &prc),
      &prc
    )
    
end

def merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1.length <=> num2.length } unless block_given?
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
end

  p dominant_octopus(FISH).last


def clever_octopus(array)
    longest = array[0]

    (1...array.length).each do |ele|
        longest = array[ele] if array[ele].length > longest.length
    end
    longest
end

  p clever_octopus(FISH)

#--------------------------------------------------------
TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, array)

    array.each_with_index do |ele, i|
        return i if dir == ele
    end

end

p slow_dance("right", TILES_ARRAY)


# I thought Hash access was O(n)?
def constant_dance(direction)
    tiles_hash = {
        "up" => 0,
        "right-up" => 1,
        "right"=> 2,
        "right-down" => 3,
        "down" => 4,
        "left-down" => 5,
        "left" => 6,
        "left-up" => 7
    }
    
    
      tiles_hash[direction]
    

end

p constant_dance("right")
