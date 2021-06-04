class HumanPlayer
  attr_reader :mark_value

  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position
    str = gets.chomp.to_i
    case str
    when 1
      [0, 0]
    when 2
      [0, 1]
    when 3
      [0, 2]
    when 4
      [1, 0]
    when 5
      [1, 1]
    when 6
      [1, 2]
    when 7
      [2, 0]
    when 8
      [2, 1]
    when 9
      [2, 2]
    else
      'Error: invalid value'
    end
  end
end
