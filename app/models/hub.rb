class Hub < ActiveRecord::Base
  has_many :drivers
  has_many :pickables
  has_many :products, through: :pickables
end
