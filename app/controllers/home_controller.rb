class HomeController < ApplicationController

  def index
  end

  def profile
  	@user_logins = current_user.user_logins
  end
  
end