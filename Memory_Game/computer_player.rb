
require_relative "board"

class ComputerPlayer


    def initialize(size = 4)
        @known_cards = {}
        @matched_cards = []
        @known_matches = []
        @board_size = size
        @prior_guess = []
        @turn = 0

    end

    def prompt
        puts "Enter a position such as 0 0 [or 'quit']"
        sleep(2)
        
        
        self.get_input
    end
        
    def get_input 
        @turn += 1
        
        if !@known_matches.empty?
            if @turn.odd?
                return @known_matches[0]
            else 
                guess = @known_matches[1]
                @known_matches = []  
                return guess
            end
        else
            guess = [nil, nil]

            while guess == [nil, nil]
                guess[0] = rand(@board_size)
                guess[1] = rand(@board_size)
                if (!@known_cards.keys.include?(guess)) && (!@matched_cards.include?(guess))
                    return guess
                end
                guess = [nil, nil]
            end
        end
        
    end

    def receive_revealed_card(pos, value)
        @prior_guess = pos
        if @known_cards.values.include?(value)
            @known_matches << pos
            @known_matches << @known_cards.key(value)
        else
            @known_cards[pos] = value
            
        end
        
    end

    def receive_match(pos_1, pos_2)
        @known_cards.delete(pos_1)
        @known_cards.delete(pos_2)
        @matched_cards.push(pos_1)
        @matched_cards.push(pos_2)

    end

    


end

