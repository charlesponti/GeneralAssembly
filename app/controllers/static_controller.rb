class StaticController < ApplicationController
  
  def home
     redirect_to '/dashboard' if current_user
  end

  def about
  end

  def contact
  end
end
