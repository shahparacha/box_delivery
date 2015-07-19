class Product < ActiveRecord::Base
  validates :thc, presence: true
  
  has_many :invoices
  has_many :pickables
  has_many :hubs, through: :pickables
  has_many :deliverables
  has_many :drivers, through: :deliverables
end
