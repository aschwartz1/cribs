class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    price_integer > 500000
  end

  def rooms_from_category(category)
    @rooms.select do |room|
      room.category == category
    end
  end

  def area
    area = 0
    @rooms.each do |room|
      area += room.area
    end

    area
  end

  def details
    {
      "price" => price_integer,
      "address" => @address
    }
  end

  def price_per_square_foot
    (price_integer.to_f / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort { |r1, r2| r2.area <=> r1.area }
  end

  private

  def price_integer
    # Dangerously assuming price is formatted like "$123456"
    price[1..price.length - 1].to_i
  end
end
