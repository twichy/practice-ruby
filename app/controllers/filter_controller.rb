class FilterController < ApplicationController
  def index
  end

  def car
    # Check if car_id present in params:
    unless params.has_key?(:car_id)
      render plain: "No car id provided", :status => :bad_request and return
    end
    
    # Check that the driver and the car really exist:
    unless Car.exists?(id: params[:car_id])
      render plain: "Car does not exists", :status => :bad_request and return
    end

    # Get car object:
    car = Car.find(params[:car_id])

    # return filter partial:
    respond_to do |format|
      format.js { render partial: "filter/format_filter_by_car.js.erb", locals: {car_obj: car} }
    end
  end

  def driver
    # Check if car_id present in params:
    unless params.has_key?(:driver_id)
      render plain: "No driver id provided", :status => :bad_request and return
    end
    
    # Check that the driver and the car really exist:
    unless Driver.exists?(id: params[:driver_id])
      render plain: "Driver does not exists", :status => :bad_request and return
    end

    # Get car object:
    driver = Driver.find(params[:driver_id])

    # return filter partial:
    respond_to do |format|
      format.js { render partial: "filter/format_filter_by_driver.js.erb", locals: {driver_obj: driver} }
    end
  end

end
