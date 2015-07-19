class InvoicesController < ApplicationController
  def create
    total = 0
    @invoices = []
    if current_user
      order_id = Invoice.get_next_order_id
      products = params[:invoice][:products]
      products.each do |product|
        product_obj = Product.find(product[:id].to_i)

        product_amount = product[:amount]
        price = product_obj.send(product_amount)
        total += price.to_i * product[:quantity]
        product_size = product_amount.gsub("price","quantity")
        product_quantity = product[:quantity]
        

        invoice = Invoice.new(invoice_params(product_obj.id, price, current_user.id, order_id, product_size, product_quantity))
        invoice.assign_driver
        invoice.save!
        @invoices.push(invoice)
      end
    end
    
    if !@invoices.empty?
      stripe_user_id = current_user.stripe_user_id

      if params[:invoice][:type] == "credit"
        Invoice.create_stripe_charge(total, stripe_user_id)
      end
      
      render json: @invoices  
    else
       render json: {
        message: 'Could not complete invoices',
      }, status: 422
    end
    
  end
  
  private
  
  def invoice_params(product_id, price, user_id, order_id, product_size, product_quantity)
    {
      order_id: order_id,
      user_id: user_id,
      product_id: product_id,
      price: price,
      quantity_type: product_size,
      longitude: params[:invoice][:longitude],
      latitude: params[:invoice][:latitude],
      payment_type: params[:invoice][:type],
      quantity: product_quantity
    }
  end
end
