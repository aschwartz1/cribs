require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$100000", "123 Main St")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_readable_attributes
    assert_equal "$100000", @house.price
    assert_equal "123 Main St", @house.address
  end

  def test_add_room
    @house.add_room(@room_1)
    assert_equal @room_1, @house.rooms.first
  end

  def test_it_has_rooms
    room_array = [@room_1, @room_2]
    @house.add_room(@room_1)
    @house.add_room(@room_2)
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

  end

  def test_area
    skip
  end

  def test_details
    skip
  end
end
