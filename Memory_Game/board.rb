require_relative "card"

class Board

    attr_reader :size, :rows
    
    def initialize(size = 4)
        @rows = Array.new(size) { Array.new(size) }
        @size = size
        populate
    end

    def [](pos)
        row, col = pos
        rows[row][col]
    end
    
    def []=(pos, value)
        row, col = pos
        rows[row][col] = value
    end

    def populate
        # Find number of pairs required and send to Card class
        # get array of shuffled Cards back
        # plug each Card into Board

        num_pairs = (@size ** 2) / 2
        cards = Card.shuffled_pairs(num_pairs)
        rows.each_index do |i|
            rows[i].each_index do |j|
                self[[i, j]] = cards.pop
            end
        end
    end

    def render
        system("clear")
        puts "  #{(0...size).to_a.join(" ")}"
        rows.each_with_index do |row, i|
            puts "#{i} #{row.join(" ")}"
        end
    end

    
    def won?
        rows.each do |ele|
            ele.each do |card|
                return false if !card.revealed?
            end
        end
        true
    end

    def reveal(pos)
        if revealed?(pos)
            puts "Card already revealed"
            
        else        
            self[pos].reveal
        end
        self[pos].value
    end

    def revealed?(pos)
        self[pos].revealed?
    end

    

end

