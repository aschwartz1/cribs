require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$100000", "123 Main St")
    @bedroom = Room.new(:bedroom, 10, '13')
    @basement = Room.new(:basement, 11, '15')
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_readable_attributes
    assert_equal "$100000", @house.price
    assert_equal "123 Main St", @house.address
  end

  def test_add_room
    @house.add_room(@bedroom)
    assert_equal @bedroom, @house.rooms.first
  end

  def test_it_has_rooms
    room_array = [@bedroom, @basement]
    @house.add_room(@bedroom)
    @house.add_room(@basement)
    assert_equal room_array, @house.rooms
  end

  def test_above_market_average_false
    assert_equal false, @house.above_market_average?
  end

  def test_above_market_average_true
    expensive_house = House.new("$999999", "1 Baller Ln")
    assert_equal true, expensive_house.above_market_average?
  end

  def test_rooms_from_category
    @house.add_room(@bedroom)
    @house.add_room(@basement)

    bedrooms = [@bedroom]
    basements = [@basement]
    assert_equal bedrooms, @house.rooms_from_category(:bedroom)
    assert_equal basements, @house.rooms_from_category(:basement)
  end

  def test_area
    expected_area = 295
    @house.add_room(@bedroom)
    @house.add_room(@basement)
    assert_equal expected_area, @house.area
  end

  def test_details
    details = {
      "price" => 100000,
      "address" => "123 Main St"
    }

    assert_equal details["price"], @house.details["price"]
    assert_equal details["address"], @house.details["address"]
  end
end
