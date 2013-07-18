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
     @schedule.start_date.strftime('%Y-%m-%d').should eq '2013-01-01'
    end
  end
  describe '#slotcode' do
    it 'should return the time_slot slotcode of the schedule' do
      @schedule.slotcode.should eq 'M1'
    end
  end
  describe '#print_times' do
    it 'should print times of schedule' do
      @schedule.print_times.should eq ' 9:00 - 12:00'
    end
  end
end