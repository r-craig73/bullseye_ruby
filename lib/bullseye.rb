require('pry')

# Board class, initializing arguments and bullseye method
class Board
  def initialize(targets, positions, closest_targets)
    @targets = targets
    @positions = positions
    @closest_targets = closest_targets
  end

  def bullseye
    darts = @targets
    locations = @positions
    near_bullseye = @closest_targets

    # add new_array array to square each location element [x^2]
    new_array = []
    i = 0
    while i < darts
      j = 0
      while j < 2
        z = locations[i][j]**2
        new_array.push(z)
        j += 1
      end
      i += 1
    end

    # add radius array to calculate x & y distance [radius]
    radius = []
    k = 0
    while k < darts
      w = new_array[k * 2]
      x = new_array[k * 2 + 1]
      distance = Math.sqrt(w + x)
      radius.push(distance)

      # append radius to each location [x, y, radius]
      locations[k] << radius[k]
      k += 1
    end

    # spots = []
    p = 0
    while p < near_bullseye
      # sort each location by ascending radius [x, y, radius]
      locations.sort_by!(&:last)
      close_targets = locations[p]
      close_targets.pop
      close_targets.push
      p += 1
    end
    close_targets
  end
end
