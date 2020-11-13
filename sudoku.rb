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
    # regions on the first line
    region_1r_1c = grid.map { |ary| ary.first(3) }.first(3).flatten
    region_1r_2c = grid.map { |ary| ary.first(6).last(3) }.first(3).flatten
    region_1r_3c = grid.map { |ary| ary.last(3) }.first(3).flatten
    # regions on the middle line
    # start with the forth_region
    region_2r_1c = grid.map { |ary| ary.first(3) }.first(6).last(3).flatten
    region_2r_2c = grid.map { |ary| ary.first(6).last(3) }.first(6).last(3).flatten
    region_2r_3c = grid.map { |ary| ary.last(3) }.first(6).last(3).flatten
    # regions on the last line
    region_3r_1c = grid.map { |ary| ary.first(3) }.last(3).flatten
    region_3r_2c = grid.map { |ary| ary.first(6).last(3) }.last(3).flatten
    region_3r_3c = grid.map { |ary| ary.last(3) }.last(3).flatten
    regions = [region_1r_1c, region_1r_2c, region_1r_3c, region_2r_1c, region_2r_2c, region_2r_3c, region_3r_1c, region_3r_2c, region_3r_3c]
  end

  def region_center
  end
end
