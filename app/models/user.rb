class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, 
          :rememberable, :trackable, :validatable, :omniauthable
  
  has_many :invoices
  has_many :authorizations, :dependent => :destroy
  has_many :products, through: :invoices
  
  has_attached_file :recommendation_image, 
                     styles: { :medium => "400x200>", :thumb => "200x100>" }
  validates_attachment_content_type :recommendation_image, :content_type => /^image\/(png|gif|jpeg|jpg)/
  
  has_attached_file :license_image, 
                     styles: { :medium => "400x200>", :thumb => "200x100>" }
  validates_attachment_content_type :license_image, :content_type => /^image\/(png|gif|jpeg|jpg)/

end
