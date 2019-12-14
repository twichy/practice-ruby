class AssignmentsController < ApplicationController
  def show
  end

  def assign
    validate_params
    
    # Get the driver and car objects:
    driver = Driver.find(params[:driver_id])
    car = Car.find(params[:car_id])

    # check if the association already exists:
    if driver.cars.where(id: params[:car_id]).exists?
      render plain: "The driver and the car are already associated", :status => :bad_request and return
    end

    # Add the car to the driver:
    driver.cars << car
    if request.xhr?
      respond_to do |format|
        format.js { render partial: "assignments/format_assignment_list.js.erb" }
      end
    else
      render plain: "The driver is now associated with the car" and return
    end

  end

  def remove
    validate_params
    
    # Get the driver and car objects:
    driver = Driver.find(params[:driver_id])
    car = Car.find(params[:car_id])

    # check if the association already exists:
    unless driver.cars.where(id: params[:car_id]).exists?
      render plain: "The driver and the car are not associated", :status => :bad_request and return
    end

    # remove the association:
    driver.cars.delete(car)
    if request.xhr?
      respond_to do |format|
        format.js { render partial: "assignments/format_assignment_list.js.erb" }
      end
    else
      render plain: "The driver is now not associated with the car" and return
    end
  end

  private
    def validate_params
      # Check input params for validity:
      unless params.has_key?(:driver_id) || params.has_key?(:car_id)
        render plain: "Bad arguments provided", :status => :bad_request and return
      end

      # Check that the driver and the car really exist:
      unless Driver.exists?(id: params[:driver_id]) || Car.exists?(id: params[:car_id])
        render plain: "Car or driver do not exists", :status => :bad_request and return
      end
    end
end
