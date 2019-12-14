require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  test "should save the driver" do
    driver = Driver.new
    driver.name = "driver"
    driver.email = "test@test.com"
    assert driver.save, "Did not save a valid driver"
  end

  test "should not save a driver without a name" do
    driver = Driver.new
    # driver.name = "driver"
    driver.email = "test@test.com"
    assert_not driver.save, "Saved the driver without a name"
  end

  test "should not save a driver without an email" do
    driver = Driver.new
    driver.name = "driver"
    # driver.email = "test@test.com"
    assert_not driver.save, "Saved the driver without an email"
  end

  test "should not save a driver with an invalid email" do
    driver = Driver.new
    driver.name = "driver"
    driver.email = "invalid"
    assert_not driver.save, "Saved the driver with an invalid email"
  end
end
