class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to list_path(current_user.list)
    end
  end
end
