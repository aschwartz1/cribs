class Room
  attr_reader :category

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
  end

  def area
    @length * width_number
  end

  def width_number
    @width.to_i
  end
end
