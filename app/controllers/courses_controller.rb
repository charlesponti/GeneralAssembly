class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    room = Room.find(params[:course][:room][:room_id].to_i)
    @course.seats, @course.room_id = room.capacity, room.id
    scheds = []
    params[:times].each do |time|
      scheds << Schedule.new(time_slot_id: time[:time_slot_id], room_id: room.id, 
        start_date: params[:start_date], end_date: params[:end_date] )
    end
    compare = (@course.room.bookings - (scheds.map { |x| x.slotcode})).length
    if @course.room.bookings.length == compare
      if @course.save
        scheds.each do |i| 
          i.course_id = @course.id
          i.save
        end
        redirect_to @course, notice: 'Course was successfully created.'
      end
    else
      redirect_to action:'new', notice: 'The dates you selected are taken.'
    end
    # respond_to do |format|
    #   if @course.save
    #     format.html { redirect_to @course, notice: 'Course was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @course }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @course.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    params[:course][:schedules_attributes].each do |sc|
      if sc[1][:_destroy] == 'false'
        sc[1][:room_id] = params[:course][:room][:room_id]
        sc[1][:start_date] = params[:start_date]
        sc[1][:end_date] = params[:end_date]
      end
    end
    binding.pry
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
  
  def sign_up
    @course = Course.find(params[:id])
    if current_user.add_course @course
      redirect_to '/students/1', notice: "You have signed up for #{@course.name}!" 
    else
      redirect_to '/teachers', notice: "You cannot fit #{@course.name} into your schedule!"
    end
  end
  
  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :description, :price, :teacher_id, :course_image, :room_id, 
        times: :time_slot_id, schedules_attributes: [:room_id, :start_date, :end_date, :time_slot_id, :id, :_destroy])
    end
end
