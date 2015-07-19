class DeliverablesController < ApplicationController
  def show
    @deliverable = Deliverable.find(params[:id])
  end
  
  def create
    @deliverable = Deliverable.new(deliverable_params)
    if @deliverable.save
      render
    else
      render json: {
        message: 'Validation Failed',
        errors: @deliverable.errors.full_messages
      }, status: 422
    end
  end
  
  def update
    @deliverable = Deliverable.find(params[:id])
    if @deliverable.update_attributes(deliverable_params)
      render
    else
      render json: {
        message: 'Validation Failed',
        errors: @deliverable.errors.full_messages
      }, status: 422
    end
  end
  
  private
  
  def deliverable_params
    {
      driver_id: params[:driver_id],
      product_id: params[:product_id],
      quantity: params[:quantity]
    }
  end
end