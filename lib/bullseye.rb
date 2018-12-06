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

    # add squares array to square each location element [x^2]
    squares = []
    i = 0
    while i < darts
      j = 0
      while j < 2
        z = locations[i][j]**2
        squares.push(z)
        j += 1
      end
      i += 1
    end

    # add radius array to calculate x & y distance [radius]
    radius = []
    k = 0
    while k < darts
      w = squares[k * 2]
      x = squares[k * 2 + 1]
      distance = Math.sqrt(w + x)
      radius.push(distance)

      # append radius to each location [x, y, radius]
      locations[k] << radius[k]
      k += 1
    end

    # sort each location by ascending radius [x, y, radius]
    locations.sort_by!(&:last)
    spots = []
    p = 0
    while p < near_bullseye
      close_targets = locations[p]
      close_targets.pop
      return close_targets if near_bullseye == 1
      spots.push(close_targets)
      p += 1
    end
    spots
  end
end
