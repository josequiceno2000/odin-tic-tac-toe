# Player class contains a name and symbol "X" or "O"
class Player
  attr_accessor :name, :symbol

  def initialize(name = '', symbol = '')
    @name = name
    @symbol = symbol
  end
end