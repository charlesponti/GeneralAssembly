class SessionsController < ApplicationController

  def create
    user = Student.find_by(username: params[:username])
    binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/', notice: 'Successfully Logged In'
    else
      redirect_to '/students/new', notice: 'Invalid Log In Credentials'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
