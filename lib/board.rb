require 'pry'

class Board
  attr_accessor :cells, :board


  def initialize
    @cells = Array.new(9, " ")

  end

  def cells
    @cells
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    print " " + @cells[0..2].join(" | ") + " "
    print "-----------"
    print " " + @cells[3..5].join(" | ") + " "
    print "-----------"
    print " " + @cells[6..8].join(" | ") + " "
  end

  def position(input)
    i = input.to_i
    @cells[i-1]
  end

  def full?
    if @cells.detect{|place| place == " "}
      return false
    elsif @cells.each{|place| place == "X" || place == "O"}
      return true
    end
  end

  def turn_count
    @cells.count do |position|
      position == "X" || position == "O"
    end
  end

  def taken?(index)
    index = index.to_i
    @cells[index-1] == "X" || @cells[index-1] == "O"
  end

  def valid_move?(index)
    index = index.to_i
    !taken?(index) && index.between?(1,9)
  end

  def update(index, player)
    #binding.pry
    @player = "X"
    index = index.to_i
    @cells[index-1]=@player
  end

end
