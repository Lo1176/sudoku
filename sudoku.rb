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
    region_1r_1c = grid.map { |ary| ary.first(3) }.take(3).flatten
    region_1r_3c = grid.map { |ary| ary.last(3) }.take(3).flatten
    region_1r_2c = grid.map { |ary| ary.first(6).last(3) }.take(3).flattent
  end

  def region_center
  end
end
