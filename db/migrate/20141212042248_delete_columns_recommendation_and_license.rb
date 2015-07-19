class DeleteColumnsRecommendationAndLicense < ActiveRecord::Migration
  def change
    add_attachment :users, :recommendation_image
    add_attachment :users, :license_image
  end
end
