# frozen_string_literal: true


# definition of each cube side
class Side
  attr_accessor :row1, :row2, :row3

  def initialize(color)
    @row1 = [color, color, color]
    @row2 = [color, color, color]
    @row3 = [color, color, color]
  end

  def side_rotate_left
    trow1 = row1[0...row1.length] Array.new(row1)
    trow2 = Array.new(row2)
    trow3 = Array.new(row3)
    row1[0], row1[1], row1[2] = trow1[2], trow2[2], trow3[2]
    row2[0], row2[1], row2[2] = trow1[1], trow2[1], trow3[1]
    row3[0], row3[1], row3[2] = trow1[0], trow2[0], trow3[0]
  end

  def reset

  end
  def side_rotate_right
    trow1 = Array.new(row1)
    trow2 = Array.new(row2)
    trow3 = Array.new(row3)
    row1[0], row1[1], row1[2] = trow3[0], trow2[0], trow1[0]
    row2[0], row2[1], row2[2] = trow3[1], trow2[1], trow1[1]
    row3[0], row3[1], row3[2] = trow3[2], trow2[2], trow1[2]
  end
end


class Rubik
  def initialize
    @front = Side.new('G')
    @right = Side.new('R')
    @left = Side.new('O')
    @up = Side.new('W')
    @down = Side.new('Y')
    @back = Side.new('B')
  end

  def print_cube
    print '---------------|'
    print @up.row1
    puts '|---------------|---------------|'
    print '---------------|'
    print @up.row2
    puts '|---------------|---------------|'
    print '---------------|'
    print @up.row3
    puts '|---------------|---------------|'
    print @left.row1
    print '|'
    print @front.row1
    print '|'
    print @right.row1
    print '|'
    print @back.row1
    puts '|'
    print @left.row2
    print '|'
    print @front.row2
    print '|'
    print @right.row2
    print '|'
    print @back.row2
    puts '|'
    print @left.row3
    print '|'
    print @front.row3
    print '|'
    print @right.row3
    print '|'
    print @back.row3
    puts '|'
    print '---------------|'
    print @down.row1
    puts '|---------------|---------------|'
    print '---------------|'
    print @down.row2
    puts '|---------------|---------------|'
    print '---------------|'
    print @down.row3
    puts '|---------------|---------------|'
  end

  def rotate_left
    @front, @right, @back, @left = @left, @front, @right, @back
    @up.side_rotate_left
    @down.side_rotate_left
  end

  def rotate_right
    @front, @right, @back, @left = @right, @back, @left, @front
    @up.side_rotate_right
    @down.side_rotate_right
  end

  def move_up
    @up.side_rotate_right

    @front.row1, @right.row1, @back.row1, @left.row1 = @right.row1, @back.row1, @left.row1, @front.row1
  end

  def move_up_inv
    @up.side_rotate_left

    @front.row1, @right.row1, @back.row1, @left.row1 = @left.row1, @front.row1, @right.row1, @back.row1
  end

  def move_down
    @down.side_rotate_right

    @front.row3, @right.row3, @back.row3, @left.row3 = @left.row3, @front.row3, @right.row3, @back.row3
  end

  def move_down_inv
    @down.side_rotate_left

    @front.row3, @right.row3, @back.row3, @left.row3 = @right.row3, @back.row3, @left.row3, @front.row3
  end

  def move_right
    @right.side_rotate_right

    @up.row1[2], @back.row3[0], @down.row1[2], @front.row1[2] = @front.row1[2], @up.row1[2], @back.row3[0], @down.row1[2]
    @up.row2[2], @back.row2[0], @down.row2[2], @front.row2[2] = @front.row2[2], @up.row2[2], @back.row2[0], @down.row2[2]
    @up.row3[2], @back.row1[0], @down.row3[2], @front.row3[2] = @front.row3[2], @up.row3[2], @back.row1[0], @down.row3[2]
  end

  def move_right_inv
    @right.side_rotate_left

    @up.row1[2], @back.row3[0], @down.row1[2], @front.row1[2] = @back.row3[0], @down.row1[2], @front.row1[2], @up.row1[2]
    @up.row2[2], @back.row2[0], @down.row2[2], @front.row2[2] = @back.row2[0], @down.row2[2], @front.row2[2], @up.row2[2]
    @up.row3[2], @back.row1[0], @down.row3[2], @front.row3[2] = @back.row1[0], @down.row3[2], @front.row3[2], @up.row3[2]
  end

  def move_left
    @left.side_rotate_right

    @front.row1[0], @up.row1[0], @back.row3[2], @down.row1[0] = @up.row1[0], @back.row3[2], @down.row1[0], @front.row1[0]
    @front.row2[0], @up.row2[0], @back.row2[2], @down.row2[0] = @up.row2[0], @back.row2[2], @down.row2[0], @front.row2[0]
    @front.row3[0], @up.row3[0], @back.row1[2], @down.row3[0] = @up.row3[0], @back.row1[2], @down.row3[0], @front.row3[0]
  end

  def move_left_inv
    @left.side_rotate_left

    @up.row1[0], @back.row3[2], @down.row1[0], @front.row1[0] = @front.row1[0], @up.row1[0], @back.row3[2], @down.row1[0]
    @up.row2[0], @back.row2[2], @down.row2[0], @front.row2[0] = @front.row2[0], @up.row2[0], @back.row2[2], @down.row2[0]
    @up.row3[0], @back.row1[2], @down.row3[0], @front.row3[0] = @front.row3[0], @up.row3[0], @back.row1[2], @down.row3[0]
  end

  def move_front
    @front.side_rotate_right

    @up.row3[0], @right.row1[0], @down.row1[0], @left.row1[2] = @left.row1[2], @up.row3[0], @right.row1[0], @down.row1[0]
    @up.row3[1], @right.row2[0], @down.row1[1], @left.row2[2] = @left.row2[2], @up.row3[1], @right.row2[0], @down.row1[1]
    @up.row3[2], @right.row3[0], @down.row1[2], @left.row3[2] = @left.row3[2], @up.row3[2], @right.row3[0], @down.row1[2]
    @down.row1[0], @down.row1[2] = @down.row1[2], @down.row1[0]
    @up.row3[0], @up.row3[2] = @up.row3[2], @up.row3[0]

  end

  def move_front_inv
    @front.side_rotate_left

    @up.row3[0], @right.row1[0], @down.row1[0], @left.row1[2] = @right.row1[0], @down.row1[0], @left.row1[2], @up.row3[0]
    @up.row3[1], @right.row2[0], @down.row1[1], @left.row2[2] = @right.row2[0], @down.row1[1], @left.row2[2], @up.row3[1]
    @up.row3[2], @right.row3[0], @down.row1[2], @left.row3[2] = @right.row3[0], @down.row1[2], @left.row3[2], @up.row3[2]
    @right.row1[0], @right.row3[0] = @right.row3[0], @right.row1[0]
    @left.row1[2], @left.row3[2] = @left.row3[2], @left.row1[2]
  end

  def move_back

  end

  def move_back_inv

  end
  # @param [Object] str
  def move_cube(str)
    str = str.split(' ')
    str.each do |move|
      case move
      when 'R'
        move_right
      when "R'"
        move_right_inv
      when 'L'
        move_left
      when "L'"
        move_left_inv
      when 'U'
        move_up
      when "U'"
        move_up_inv
      when 'D'
        move_down
      when "D'"
        move_down_inv
      when "F"
        move_front
      when "F'"
        move_front_inv
      when "B"
        move_back
      when "B'"
        move_back_inv
      end
    end
  end
end

rubik_cube = Rubik.new
#rubik_cube.rotate_right
input = gets.chomp!
rubik_cube.move_cube(input)
#rubik_cube.move_cube("R D R' L D L' D U R")
rubik_cube.print_cube
