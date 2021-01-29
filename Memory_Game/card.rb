
class Card

    CARD_VALUES = ("A".."Z").to_a

    attr_reader :value
    
    def initialize(value, revealed = false)
        @value = value
        @revealed = revealed
    end

    def reveal
        @revealed = true
    end

    def hide
        @revealed = false
    end

    def ==(object)
        object.is_a?(self.class) && object.value == value
    end

    def to_s
        revealed? ? value.to_s : " "
    end

    def revealed?
        @revealed
    end

    # Card pairs
    # get number of pairs (8) from number of board spaces in Board (16)
    # shuffle VALUES and get first 8 results
    # multiply results by 2 to get doubles of each value, then shuffle array
    # return an array to Board, where elements are Card instances with values from 
        # results array

    def self.shuffled_pairs(num_pairs)
        values = CARD_VALUES

        card_pairs = (values.take(num_pairs) * 2).shuffle
        card_pairs.map { |val| Card.new(val)} 

    end

end

