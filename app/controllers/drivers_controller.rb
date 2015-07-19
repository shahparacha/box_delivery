class DriversController < ApplicationController
  
  def show
    @driver = Driver.find(params[:id])
  end
  
  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      render
    else
      render json: {
        message: 'Validation Failed',
        errors: @driver.errors.full_messages
      }, status: 422
    end
  end
  
  def update
    @driver = Driver.find(params[:id])
    if @driver.update_attributes(driver_params)
      render
    else
      render json: {
        message: 'Validation Failed',
        errors: @driver.errors.full_messages
      }, status: 422
    end
  end
  
  private
  
  def driver_params
    {
      name: params[:name],
      region_id: params[:region_id]
    }
  end
end
