class Board
    attr_accessor :cells 
    
    def initialize 
        self.reset!
    end 

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end 

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end 

    def position(input)
        index = input.to_i - 1
        @cells[index]
    end 

    def full?
        @cells.detect do | cell | 
            if cell == " "
                return false
            end 
        end 
        true
    end 

    def turn_count
        9 - @cells.count(" ")
    end 

    def taken?(input)
        if position(input) == "X" || position(input) == "O"
            true 
        else 
            false
        end 
    end  

    def valid_move?(input)
       taken?(input) == false && input.to_i.between?(1,9)
    end 

    def update(position, player)
        @cells[position.to_i - 1] = player.token
    end 

end 