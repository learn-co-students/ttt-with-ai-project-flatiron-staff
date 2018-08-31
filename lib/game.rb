class Game
  attr_accessor :board, :player_1, :player_2, :token

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def current_player
    board.cells.count{|position| position == "O" || position == "X"}.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]
      #binding.pry

      if (position_1 == "X" && "#{position_2}" == "X" && "#{position_3}" == "X") || ("#{position_1}" == "O" && "#{position_2}" == "O" && "#{position_3}" == "O")
        win_combination
      else
        false
      end
    end
  end


  def draw?
    @board.full? && !won? ? true : false
  end

  def over?
   (won? || draw?) ? true : false
  end

  def winner
    WIN_COMBINATIONS.detect do |win_combination| #goes through each individual arrays in the nested array
      win_index_1 = win_combination[0] # gives backthe numbers in the arrays
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1] # load the value of the board at win_index_1
      position_2 = @board.cells[win_index_2] # load the value of the board at win_index_2
      position_3 = @board.cells[win_index_3] # load the value of the board at win_index_3

      if ("#{position_1}" == "X" && "#{position_2}" == "X" && "#{position_3}" == "X")
        return "X"

      elsif ("#{position_1}" == "O" && "#{position_2}" == "O" && "#{position_3}" == "O")
        return "O"
      end
    end
  end


  def turn
    puts "Please enter a number 1-9:"
    @user_input = current_player.move(@board)
    if @board.valid_move?(@user_input)
      @board.update(@user_input, current_player)
    else puts "Please enter a number 1-9:"
      @board.display
      turn
    end
    @board.display
  end
  
  def play
    @board.reset!
    while self.over? == false
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
      if "X" == self.winner
        @player_1.win_count = @player_1.win_count + 1
      else
        @player_2.win_count = @player_2.win_count + 1
      end
    elsif self.draw?
      puts "Cats Game!"
      #@@draw_count += 1
    end
  end

end
