class Driver < ActiveRecord::Base   
  has_many :invoices
  has_many :deliverables
  has_many :products, through: :deliverables
  belongs_to :hub
  
  reverse_geocoded_by :latitude, :longitude
  
  # after_save :check_cash_amount
  
  def google_maps_dir(end_latitude, end_longitude)
    current_latitude, current_longitude = self.latitude, self.longitude
    url = "http://maps.googleapis.com/maps/api/directions/json?origin=" + 
             current_latitude.to_s + "," +  current_longitude.to_s + "&destination=" + 
              end_latitude.to_s + "," + end_longitude.to_s + "&sensor=true&region=gb"
    JSON.parse(open(url).read)
  end
  
  def delivery_params(end_latitude, end_longitude)
    dir_json = google_maps_dir(end_latitude, end_longitude)
    dir_json["routes"][0]["legs"][0]
  end
  
  def new_delivery(invoice, delivery_time)
    self.update_attributes({estimated_last_delivery_time: delivery_time,
                                               longitude: invoice.longitude,
                                                latitude: invoice.latitude})
    self.update_deliverable(invoice)
  end
  
  def update_deliverable(invoice)
    if invoice.payment_type == 'cash'
      self.total_cash += invoice.price 
      self.save
    end
    self.todays_deliverables.each do |deliverable|
      if deliverable.product_id == self.product_id
        method = invoice.quantity_type
        amount_left = deliverable.send(method) - 1
        deliverable.send("#{method}=", amount_left)
        deliverable.save
      end
    end
  end
  
  # def go_to_hub
  #   region_hub = self.hub
  #   delivery_params = delivery_params(region_hub.latitude, region_hub.longitude)
  #   dist_in_min = delivery_params["duration"]["text"].gsub(/[^\d]/, '')
  #   estimated_time = self.estimated_last_delivery_time +
  #                          dist_in_min.to_i.minutes + 1.minutes
  #   self.update_attributes(set_refill(estimated_time))
  # end
  #
  def todays_deliverables
    self.deliverables.where('DATE(created_at) = ?', Date.today)
  end
  
  private
  
  def set_refill(estimated_time)
    {
      estimated_last_delivery_time: estimated_time,
      longitude: self.hub.longitude,
      latitude: self.hub.latitude,
      is_delivering: false
    }
  end
  
  # def check_cash_amount
  #   go_to_hub if self.total_cash < 300
  # end
end


