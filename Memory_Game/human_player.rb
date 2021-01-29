
class HumanPlayer


    def initialize
        @name = "Frank"

    end

    def prompt
        puts "Enter a position such as 0 0 [or 'quit']"
        self.get_input
    end
        
    def get_input 
        user_input = gets.chomp
            
        if user_input == "quit"
            exit(true)
        end

        user_input.split(" ").map {|ele| ele.to_i}
    end

    def receive_revealed_card(pos, value)
        #Ducktype!
    end

    def receive_match(pos_1, pos_2)
        #Ducktype!

    end


end

