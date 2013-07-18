require 'spec_helper'
require 'pp'

describe User do
  before :each do
      @user = User.create!(name:'Meow', bio:'lalalala',role:'student',dob:'1986-04-04',password:'meow',
        password_confirmation:'meow', email:'alalala@la.com', address:'flarm', username:'flarm')
      @course = Course.create!(name:'Meow', price:7000, teacher_id: 5, description:'flarm', seats: 50)
      @course2 = Course.create!(name:'Meow2', price:7000, teacher_id: 5, description:'flarm', seats: 50)
  end
  describe '#initialize' do
    it "should create a new instance of user" do
      @user.class.should eq(User)
    end
    it "should set user's role" do
      @user.role.should eq('student')
    end
    it 'should set courses relation' do
      @user.courses.class.should eq(ActiveRecord::Associations::CollectionProxy::ActiveRecord_Associations_CollectionProxy_Course)
    end
    it 'should set user password' do
      @user.authenticate('meow').should eq(@user)
    end
    it 'should set user balance to 0' do
      @user.balance.to_i.should eq(0)
    end
  end
  describe '#set_initial_balance' do
    it 'should set user balance to 0' do
      @user.set_initial_balance
      @user.balance.should eq 0
    end
  end
  describe '#update_balance' do
    it 'should add to user balance' do
      @user.update_balance('add',2000)
      @user.balance.to_i.should eq(2000)
    end
    it 'should subtract from user balance' do
      @user.update_balance('subtract',2000)
      @user.balance.to_i.should eq(-2000)
    end
  end
  describe '#current_schedule' do
    it "should return an array of the user's courses" do
      @user.add_course @course
      @user.courses.first.should eq @course
    end
  end
  describe '#booked' do
    it 'should return true if user is signed up for course' do
      @user.add_course @course
      @user.booked?(@course).should eq '1'
    end
  end
  describe '#add_course' do
    before do 
      @user.add_course(@course2)
    end
    it 'should add course to user schedule' do
      @user.courses.last.should eq @course2
    end
    it 'should update user schedule count' do
      @user.courses.count.should eq 1
    end
    it 'should add course price to user balance' do
      @user.balance.to_i.should eq((@course2.price).to_i)
    end
    it 'should remove one seat from course' do
      @course2.seats.should eq 49
    end
  end
  describe '#drop_course' do
    before do
      @user.add_course @course
      @user.drop_course @course
    end
    it 'should remove course from student schedule' do
      @user.courses.count.should eq 0
    end
    it 'should refund course price to student' do
      @user.balance.to_i.should eq 0
    end
    it 'should add seat back to course' do
      @course.seats.should eq 50
    end
  end
  describe '#can_add_course' do
    it 'should return false if student is already signed up for course' do
      @user.add_course @course
      @user.can_add_course @course
    end
  end
end