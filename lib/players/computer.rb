module Players
  class Computer < Player
    attr_accessor :board
    def move(board)
      input = gets.strip
      Board.valid_move?(input)

    end
  end
end
