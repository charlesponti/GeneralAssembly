class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource only: [:index, :create, :destroy]

  def index
    @users = User.all
  end

  def show
    set_courses
  end

  def new
    @user = User.new
  end

  def edit
    unless @user.id == current_user.id
      authorize! :manage, :all
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def dashboard
    @user = User.find(current_user.id)
    set_courses
    render :show
  end

  def students
    admin_only
    @students = User.students
  end

  def teachers
    admin_only
    @teachers = User.teachers
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def set_courses
      @courses = case @user.role
        when 'student' then @user.courses
        when 'teacher' then @user.teaching
      end
    end

    def user_params
      params.require(:user).permit(:name, :dob, :address, :email,  :bio, :user_image, :role,
       :username, :password, :password_confirmation)
    end
end
