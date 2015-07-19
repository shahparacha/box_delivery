class Pickable < ActiveRecord::Base
  validates :hub_id, presence: true
  validates :product_id, presence: true
  
  belongs_to :hub
  belongs_to :product
end
