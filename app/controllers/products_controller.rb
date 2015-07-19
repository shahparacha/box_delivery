class ProductsController < ApplicationController
  before_action :user_logged_in?
  
  def index
    @products = Product.where(delivering_today: true)
    render json: @products.to_json
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      render
    else
      render json: {
        message: 'Validation Failed',
        errors: @product.errors.full_messages
      }, status: 422
    end
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      render
    else
      render json: {
        message: 'Validation Failed',
        errors: @product.errors.full_messages
      }, status: 422
    end
  end
  
  private
  
  def product_params
    {
      name: params[:name],
      product_description: params[:product_description],
      gram_price: params[:gram_price]
    }
  end
end
