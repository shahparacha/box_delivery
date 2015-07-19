class HubsController < ApplicationController
  def show
    @hub = Hub.find(params[:id])
  end
  
  def create
    @hub = Hub.new(hub_params)
    if @hub.save
      render
    else
      render json: {
        message: 'Validation Failed',
        errors: @hub.errors.full_messages
      }, status: 422
    end
  end
  
  def update
    @hub = Hub.find(params[:id])
    if @hub.update_attributes(hub_params)
      render
    else
      render json: {
        message: 'Validation Failed',
        errors: @hub.errors.full_messages
      }, status: 422
    end
  end
  
  private
  
  def hub_params
    {
      address: params[:address]
    }
  end
end
