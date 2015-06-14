require './user'

class Human < User

  attr_accessor :name

  def coin
    HUMAN_COIN
  end

end
