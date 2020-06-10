module Players
    class Computer < Player

        def check_for_opportunity_to_win(board)
            Game::WIN_COMBINATIONS.each do |combo|
                if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == self.token && board.cells[combo[2]] == " "
                    index = combo[2]
                    return index + 1
                elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] == self.token && board.cells[combo[1]] == " "
                    index = combo[1]
                    return index + 1
                elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[1]] == self.token && board.cells[combo[0]] == " "
                    index = combo[0]
                    return index + 1
                end                 
            end
            return nil
        end 
        
        def check_for_opportunity_to_block(board)
            opponent_token = self.token == "X" ? "O" : "X"
            Game::WIN_COMBINATIONS.each do |combo|
            if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == opponent_token && board.cells[combo[2]] == " "
                    index = combo[2]
                    return index + 1
                elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] == opponent_token && board.cells[combo[1]] == " "
                    index = combo[1]
                    return index + 1
                elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[1]] == opponent_token && board.cells[combo[0]] == " "
                    index = combo[0]
                    return index + 1
                end                 
            end
            return nil
        end 

        def check_for_penultimate_move(board)
            Game::WIN_COMBINATIONS.each do |combo|
                if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == " " && board.cells[combo[2]] == self.token
                    index = combo[0]
                    return index + 1
                elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] == " " && board.cells[combo[1]] == self.token
                    index = combo[0]
                    return index + 1
                elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[1]] == " " && board.cells[combo[0]] == self.token
                    index = combo[1]
                    return index + 1
                end                 
            end
            return nil
        end 

        def make_first_move(board)
            board.taken?("5") ? "1" : "5"
        end 
        
        def move(board)
          result = check_for_opportunity_to_win(board)
        #   puts "RESULT OF OP TO WIN: #{result}"
          if result
            return result
          end 
          result = check_for_opportunity_to_block(board)
        #   puts "RESULT OF OP TO BLOCK: #{result}"
          if result
            return result
          end 
          result = check_for_penultimate_move(board)
        #   puts "RESULT OF PEN: #{result}"
          if result
            return result
          end 
          result = make_first_move(board)
        #   puts "RESULT OF MAKE FIRST: #{result}"
          if result
            return result
          end 
        end 

    end 
end 