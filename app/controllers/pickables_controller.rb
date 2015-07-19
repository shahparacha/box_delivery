class PickablesController < ApplicationController
  def show
    @pickable = Pickable.find(params[:id])
  end
  
  def create
    @pickable = Pickable.new(pickable_params)
    if @pickable.save
      render
    else
      render json: {
        message: 'Validation Failed',
        errors: @pickable.errors.full_messages
      }, status: 422
    end
  end
  
  def update
    @pickable = Pickable.find(params[:id])
    if @pickable.update_attributes(pickable_params)
      render
    else
      render json: {
        message: 'Validation Failed',
        errors: @pickable.errors.full_messages
      }, status: 422
    end
  end
  
  private
  
  def pickable_params
    {
      hub_id: params[:hub_id],
      product_id: params[:product_id],
      quantity: params[:quantity]
    }
  end
end
