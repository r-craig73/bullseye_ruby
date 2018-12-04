require('pry')

# Board class, initializing arguments and bullseye method
class Board
  def initialize(targets, positions, closest_targets)
    @targets = targets
    @positions = positions
    @closest_targets = closest_targets
  end

  def bullseye
    # darts = @targets
    locations = @positions
    # near_bullseye = @closest_targets
    new_array = []
    locations.each do |location|
      # add nested loops to calculate the location radius
      new_array.push(location * 2)
    end
    new_array
    # Math.sqrt(locations[2][0]**2 + locations[2][1]**2)
  end
end
