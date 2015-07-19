class Invoice < ActiveRecord::Base 
  validates :price, presence: true
  validates :product_id, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :payment_type, presence: true, inclusion: { in: %w(cash credit) }
  validates :quantity_type, presence: true, inclusion: { in: %w(gram_quantity 
                                                                eight_ounce_quantity 
                                                                fourth_quantity 
                                                                half_ounce_quantity) }
  belongs_to :product
  belongs_to :driver
  belongs_to :user
  
  reverse_geocoded_by :latitude, :longitude
  
  def self.get_next_order_id
    max_order_id = Invoice.maximum("order_id")
    max_order_id ? max_order_id + 1 : 1
  end
  
  def self.create_stripe_charge(total, stripe_user_id)
    Stripe::Charge.create(
        :amount => total*100,
        :currency => "usd",
        :customer => stripe_user_id
    )
  end
  
  def assign_driver
    unless self.driver_id
      quickest_driver, quickest_time, delivery_time = nil, nil, nil
      Driver.where(is_delivering: true).each do |driver|
        delivery_params = driver.delivery_params(self.latitude, 
                                                 self.longitude)
        dist_in_min = delivery_params["duration"]["text"].gsub(/[^\d]/, '')
        estimated_time = driver.estimated_last_delivery_time + 
                         dist_in_min.to_i.minutes + 1.minutes
        if quickest_time == nil || (quickest_time && estimated_time < quickest_time)
          quickest_driver = driver
          quickest_time = estimated_time
          delivery_time = dist_in_min.to_i
        end
      end
      # need to catch error and something here if all drivers in the region are not delivering! if so put if quickest_driver
      quickest_driver.new_delivery(self, quickest_time)
      self.driver_id = quickest_driver.id
      self.estimated_delivery_time_minutes = delivery_time
    end
  end
  
  # def completed_pickup
#     hub.pickables.each do |pickable|
#       if pickable.product_id == self.product_id
#         deliverable.quantity -= self.quantity
#         deliverable.save
#       end
#       self.completed = true
#       self.save
#     end
#   end

end
