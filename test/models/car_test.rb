require 'test_helper'

class CarTest < ActiveSupport::TestCase
  test "should save the car" do
    car = Car.new
    car.title = "driver"
    car.car_type = "mini"
    car.color = "blue"
    assert car.save, "Did not save a valid car"
  end

  test "should not save a car without a title" do
    car = Car.new
    # car.title = "driver"
    car.car_type = "mini"
    car.color = "blue"
    assert_not car.save, "Saved the car without a title"
  end

  test "should not save a car with an invalid color" do
    car = Car.new
    car.title = "driver"
    car.car_type = "mini"
    assert_raise(Exception) {
      car.color = "black"
    }
  end
end
