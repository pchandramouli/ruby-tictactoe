require './user'

class Computer < User

  def coin
    COMPUTER_COIN
  end

  def make_move
    make_first_move || pick_adjacent || pick_optimal
  end

  private 

  def make_first_move
    if game_engine.empty_positions?
      position = Random.rand(1..9)
      return game_engine.make_move self, position
    end
    false
  end

  def pick_adjacent
    game_engine.winning_positions.each do |wp|
      h_avail = wp - game_engine.human_moves

      # If there's just one position available
      # grab it and thwart the human
      if !h_avail.nil? && h_avail.count == 1
	position = (h_avail.to_a)[0] 
	return game_engine.make_move self, position if game_engine.legal_move? position
      end
    end
    false
  end

  def pick_optimal
    game_engine.winning_positions.each do |wp|
      h_avail = wp - game_engine.human_moves

      # If moves available to humans are same as the current winning set,
      # chances are that human might have made a move in another set
      # so, continue checking
      next if h_avail == wp

      # If human has more steps available, thwart it by taking
      # the immediately available pos after this
      if !h_avail.nil? && h_avail.count > 1
	position = (h_avail.to_a)[0]
	return game_engine.make_move self, position if game_engine.legal_move? position
      end
    end
    false
  end

end

