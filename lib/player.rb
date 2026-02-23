# Player class contains a name and symbol "X" or "O"
class Player
  attr_accessor :symbol

  def initialize(symbol = '')
    @symbol = symbol
  end
end