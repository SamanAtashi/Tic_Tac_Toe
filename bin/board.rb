class Board
  def initialize
    @grid = [
      %w[1 2 3],
      %w[4 5 6],
      %w[7 8 9]
    ]
  end

  def printing
    print " +---+---+---+ \n"
    @grid.each do |sub_arr|
      sub_arr.each do |ele|
        print ' | '
        print ele
      end
      print " | \n"
      print " +---+---+---+ \n"
    end
  end

  def valid?(pos)
    pos.each do |ele|
      return false if (0..2).include?(ele) == false
    end
    true
  end

  def empty?(pos)
    %w[1 2 3 4 5 6 7 8 9].include?(@grid[pos[0]][pos[1]])
  end

  def place_mark(position, mark)
    if valid?(position) && empty?(position)
      @grid[position[0]][position[1]] = mark
    else
      puts 'Invalid mark'
      puts 'Try again'
    end
  end

  def win_row?(_mark)
    false
  end

  def win_col?(_mark)
    false
  end

  def win_diagonal?(_mark)
    false
  end

  def win?(mark)
    return true if win_diagonal?(mark) || win_col?(mark) || win_row?(mark)

    false
  end

  def empty_positions?
    @grid.each do |sub_arr|
      sub_arr.each do |ele|
        return true if %w[1 2 3 4 5 6 7 8 9].include?(ele)
      end
    end
    false
  end
end
