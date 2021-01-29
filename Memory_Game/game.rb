require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game

    attr_accessor :previous_guess, :board, :player

    def initialize(player)
        @board = Board.new
        @player = player
        @previous_guess = [nil]
    end

    def [](pos)
        row, col = pos
        rows[row][col]
    end
    
    def []=(pos, value)
        row, col = pos
        rows[row][col] = value
    end

    def play
        
        while !board.won?
            system("cls")
            board.render
            pos = player.prompt  # must accept from human OR computer
           
            begin
                make_guess(pos)
            rescue NoMethodError, TypeError
                puts "Invalid position"
                sleep(3)
            end
            
        end
        puts "WIN!"
    end

    def make_guess(pos)
        if !board.revealed?(pos)
            val = board.reveal(pos)
             
            if @previous_guess == [nil]
                player.receive_revealed_card(pos, val)
                @previous_guess = pos
            elsif board[@previous_guess].value != val
                player.receive_revealed_card(pos, val)
                system("cls")
                board.render
                sleep(3)
                board[@previous_guess].hide
                board[pos].hide
                @previous_guess = [nil]
            else
                player.receive_match(pos, @previous_guess)
                @previous_guess = [nil]
                system("cls")
                board.render
                puts "Match!"
                sleep(3)
            end
        else
            puts "Card already revealed"
            
        end
    end


end

if $PROGRAM_NAME == __FILE__
    Game.new(ComputerPlayer.new).play
end