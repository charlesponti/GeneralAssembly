class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = User.teachers
  end

  def show
  end

  def new
    @teacher = User.new
    authorize! :manage, :all
  end

  def edit
    authorize! :edit, @teacher
  end

  private
    def set_teacher
      @teacher = User.find(params[:id])
    end

    def teacher_params
      params.require(:teacher).permit(:name, :email, :address, :password, :password_confirmation)
    end
end
