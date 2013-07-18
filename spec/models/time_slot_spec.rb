require 'spec_helper'

describe TimeSlot do
  before :each do
    @time_slot = TimeSlot.create!(start_time:'9:00',end_time:'12:00',day:'Monday',slotcode:'M1')
  end
  describe '#initialize' do
    it 'should set time_slot day' do
      @time_slot.day.should eq 'Monday'
    end
    it 'should set time_slot slotcode' do
      @time_slot.slotcode.should eq 'M1'
    end
    it 'should set time_slot start_time' do
      @time_slot.start_time.should eq '+2000-01-01 09:00:00 UTC'
    end
    it 'should set time_slot end_time' do
      @time_slot.end_time.should eq '+2000-01-01 12:00:00 UTC'
    end
  end
  describe '#print_times' do
    it 'should return string containing start_time and end time' do
      @time_slot.print_times.should eq ' 9:00 - 12:00'
    end
  end
  describe '#day_and_time' do
    it 'should return string with day and time' do
      @time_slot.day_and_time.should eq 'Monday : 9:00 - 12:00'
    end
  end
end