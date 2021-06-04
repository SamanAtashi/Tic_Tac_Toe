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

  def win_row?(mark)
    @grid.each do |sub_arr|
      return true if sub_arr.all? { |ele| ele == mark }
    end
    false
  end

  def win_col?(mark)
    i = 0
    count = 0
    while i < @grid.size
      j = 0
      while j < @grid[i].size
        count += 1 if @grid[j][i] == mark
        j += 1
      end
      return true if count == 3

      count = 0
      i += 1
    end
    false
  end

  def win_diagonal?(mark)
    # L->R
    i = 0
    temp_1 = []
    while i < @grid.size
      j = i
      while j < @grid.size
        temp_1 << @grid[i][j] if @grid[i][j] == mark
        j += 1
        i += 1
      end
    end
    return true if temp_1.size >= 3

    # R->L
    k = 0
    temp_2 = []
    while k < @grid.size
      f = @grid.size - 1
      while f >= 0
        temp_2 << @grid[k][f] if @grid[k][f] == mark
        f -= 1
        k += 1
      end
    end
    return true if temp_2.size >= 3

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
