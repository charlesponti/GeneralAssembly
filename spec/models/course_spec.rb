require 'spec_helper'

describe Course do
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
    it 'should create new course' do
      Course.all.count.should eq 1
    end
    it 'should set course name' do
     @course.name.should eq 'Meow'
    end
    it 'should set course price' do
      @course.price.should eq 7000
    end
    it 'should set teacher_id' do
      @course.teacher_id.should eq @user.id
    end
  end
  describe '#teacher' do
    it 'should return the user who is assigned as teacher' do
      @course.teacher.should eq @user
    end
  end
  describe '#dates' do
    it 'should return string containing start_date and end_date of course' do
      @course.dates.should eq 'January 1, 2013 to February 2, 2013'
    end
  end
  describe '#times_on' do
    it 'should return time slots whose day matches argument' do
      @course.times_on('Monday').first.should eq @time_slot
    end
  end
  describe '#slotcodes' do
    it 'should return an array' do
      @course.slotcodes.class.should eq Array
    end
    it 'should contain array of slotcodes' do
      @course.slotcodes.first.should eq 'M1'
    end
  end
  describe '#remove_seats' do
    it 'should decrease amount of seats' do
      @course.remove_seats 10
      @course.seats.should eq 40
    end
  end
  describe '#add_seats' do
    it 'should increase amout of seats' do
      @course.add_seats 10
      @course.seats.should eq 60
    end
  end
  describe '#full?' do
    it 'should return false if course.seats not equal to 0' do
      @course.full?.should eq false
    end
    it 'should return true if course.seats is equal to 0' do
      @course.remove_seats 50
      @course.full?.should eq true
    end
  end
end