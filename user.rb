class User
  attr_reader :game_engine

  HUMAN_COIN = 'x'
  COMPUTER_COIN = 'o'

  def initialize(game_engine)
    @game_engine = game_engine
  end

  def make_move(position)
    game_engine.make_move(self, position)
  end

  def wins?
    game_engine.wins? self
  end

  protected

  def game_engine
    @game_engine
  end
end
