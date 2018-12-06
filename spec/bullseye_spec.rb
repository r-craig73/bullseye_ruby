require('rspec')
require('bullseye')

describe('Board') do
  describe('bullseye') do
    it('returns the closest dart position to the bullseye') do
      board = Board.new(3, [[3, 4], [2, -2], [1, 2]], 1)
      expect(board.bullseye).to(eq([1, 2]))
    end

    it('returns the closest dart position to the bullseye') do
      board = Board.new(3, [[3, 4], [2, -2], [1, 2]], 2)
      expect(board.bullseye).to(eq([[1, 2], [2, -2]]))
    end
  end
end
