class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/dashboard', notice: 'Successfully Logged In'
    else
      redirect_to '/', notice: 'Invalid Log In Credentials'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
