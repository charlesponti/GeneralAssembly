module ApplicationHelper
  def schedules_on schedules, day
    schedules.select { |x| x.time_slot.day == 'day' }
  end
end
