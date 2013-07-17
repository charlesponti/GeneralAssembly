class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    admin_only
    @students = User.students
  end
  
  def new
    admin_only
    @student = User.new
  end

end
