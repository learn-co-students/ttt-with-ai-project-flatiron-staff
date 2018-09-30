require_relative '../player.rb'

module Players
  class Computer < Player
    def move(board, game = Game.new)
      corners = [1, 3, 7, 9]
      edges = [2, 4, 6, 8]
      # input = gets.strip
      # Board.valid_move?(input)
      if board.turn_count == 0
        corners.sample
      end

      if board.turn_count == 2
        if board.taken?(5)
          o = corners.find {|corner| board.taken?(corner)}
          opposite_corner(our_move)
        end
      end

      my_move = rand(9)+1
      until board.valid_move?(my_move)
        my_move = rand(9)+1
      end
      my_move
    end

    def opposite_corner
      case move
      when 1
        9
      when 3
        7
      when 7
        3
      when 9
        1
      end
    end
  end
end
