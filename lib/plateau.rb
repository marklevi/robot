class Plateau
  attr_reader :max_east, :max_north, :max_west, :max_south

  def initialize dimension
    x, y = dimension.split
    @max_east  = x.to_i
    @max_north = y.to_i
    @max_west  = 0
    @max_south = 0
  end

  def within_border? position
    (position.y >= max_south && position.y <= max_north &&
    position.x >= max_west && position.x <= max_east)
  end
end
