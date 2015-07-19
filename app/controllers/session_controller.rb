class SessionController < ApplicationController
  
  def destroy
    logout_user!
  end
  
end
