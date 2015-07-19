class UsersController < ApplicationController
  before_action :user_logged_in?
  
  def get_current_user
    render json: current_user
  end
  
  def update
    if current_user.update_attributes(user_params)  
       render json: current_user
    else
       render json: { errors: current_user.errors.full_messages }  
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, 
      :recommendation, :birth_date, :mobile, :recommendation_id,
      :license_number, :license_expiration, :license)
  end

end