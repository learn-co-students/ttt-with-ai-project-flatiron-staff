class Game
    attr_accessor :board, :player_1, :player_2

     WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board 
    end 

    def current_player
        count = @board.turn_count
        count % 2 == 0 ? @player_1 : @player_2
    end 

    def won? 
        WIN_COMBINATIONS.each do |combo|
            if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " "
                return combo
            end
        end
        false
    end 

    def draw?
        self.won? == false && @board.full? == true
    end 

    def over? 
        self.won? || self.draw? 
    end 

    def winner
        if self.won? 
            winning_combo = self.won? 
            @board.cells[winning_combo.first]
        else 
            nil
        end 
    end 

    def turn 
        player = current_player
        move = player.move(@board)
        if @board.valid_move?(move)
            @board.update(move, player)
        else 
            turn
        end 
    end 

    def play 
        while self.over? == false do 
            self.board.display
            puts "Please enter your next position:"
            self.turn
        end 
        if won? 
            self.board.display
            puts "Congratulations #{self.winner}!"
        end 
        if draw? 
            self.board.display
            puts "Cat's Game!"
        end 
    end 

end 