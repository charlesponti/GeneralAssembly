class SchedulesController < ApplicationController
  helper_method :schedules_on
  
  def index
    @schedules = Schedule.all
  end

end