class Deliverable < ActiveRecord::Base
  validates :product_id, presence: true
  validates :driver_id, presence: true
  
  belongs_to :product
  belongs_to :driver
  
#    after_save :ensure_product_qty
  
  
  # private
  
  # def ensure_product_qty
#     self.driver.go_to_hub if (self.product.gram_price > 30.00 &&
#                              deliverable.quantity < 15) || deliverable.quantity < 30
#   end
  
end
