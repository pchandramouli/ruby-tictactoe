class Board
  def initialize(game_engine)
    @game_engine = game_engine
  end

  def redraw
    box = box_layout.chars
    (0..2).each do |x|
      (0..2).each do |y|
	pos = (x*3) + (y+1)
	offset = offsets()[pos-1]
	pos = offset + pos
	box[pos] = @game_engine.positions[x][y]
      end
    end
    box.join
  end

  def offsets
    [16, 19, 22, 41, 44, 47, 66, 69, 72]
  end

  def box_layout
    %q{
|---|---|---|
|   |   |   |
|---|---|---|
|   |   |   |
|---|---|---|
|   |   |   |
|---|---|---|
    }
  end

end
