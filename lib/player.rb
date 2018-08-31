class Player
  attr_accessor :board, :computer, :human
  attr_reader :token

  def initialize(token)
    @token = token
  end
end
