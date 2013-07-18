require 'spec_helper'

describe Schedule do
  before :each do
    @user = User.create!(name:'Meow', bio:'lalalala',role:'teacher',dob:'1986-04-04',password:'meow',
        password_confirmation:'meow', email:'alalala@la.com', address:'flarm', username:'flarm')
    @room = Room.create!(name:'Room2',capacity:50)
    @course = Course.create!(name:'Meow', price:7000, teacher_id: @user.id, description:'flarm', seats: @room.capacity)
    @time_slot = TimeSlot.create!(start_time:'9:00',end_time:'12:00',day:'Monday',slotcode:'M1')
    @schedule = Schedule.create!(room_id: 1, course_id: @course.id, time_slot_id: @time_slot.id, 
      start_date: '2013-01-01',end_date:'2013-02-02')
  end
  describe '#initialize' do
    it 'should set start_date' do
     @schedule.start_date.should eq 'Tue, 01 Jan 2013'
    end
  end
end