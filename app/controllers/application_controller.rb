class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :authenticate
  helper_method :admin_only

  rescue_from CanCan::AccessDenied do |excepton|
    redirect_to root_url, alert: 'You cannot access this page'
  end

  def current_user
    @current_user ||=  User.find(session[:user_id]) if session[:user_id]
  end
  
  def authenticate
    if !current_user
      flash[:error] = "You must be logged in to access this site"
      redirect_to '/'
    end
  end

  def admin_only
    unless current_user && current_user.role == 'admin'
      redirect_to '/'
    end
  end
  
  private

  def can_access_route
    can = Ability.authorized? current_user, params[:controller], params[:action]
    unless can
      redirect_to "/dashboard/#{current_user.id}"
      flash[:notice] = 'You have tried to access a page you are not authorized for'
    end
  end
end
