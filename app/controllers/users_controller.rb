class UsersController < ApplicationController

  def dashboard
    if user_signed_in?
      render users_dashboard_url
    end
  end

end
