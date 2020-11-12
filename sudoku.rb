# using ArrayExtensions

# Sudoku class with methods
class Sudoku
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def rows
    grid.each { |row| row.size == row.uniq.size }
  end

  def columns
    grid.transpose.each { |row| row.size == row.uniq.size }
  end

  def regions
    region_1_1 = grid.map { |e| e.first(3) }.take(3).flatten
    region_3_1 = grid.map { |e| e.last(3) }.take(3).flatten

  end
end
