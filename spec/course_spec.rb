require 'rspec'
require './lib/course'
require './lib/student'

RSpec.describe Course do 
  before do
    @course = Course.new("Calculus", 2)

    @morgan = Student.new({name: "Morgan", age: 21})
    @jordan = Student.new({name: "Jordan", age: 29})
  end

  define "#initialize" do
    it "exists and has readable attributes" do
      expect(@course).to be_a Course
      expect(@course.name).to eq "Calculus"
      expect(@course.capacity).to eq 2
      expect(@course.students).to eq []
    end
  end

  describe "#enroll" do
    it "can enroll a student in a course" do
      @course.enroll(@morgan)
      @course.enroll(@jordan)

      expect(@course.students).to eq [@morgan, @jordan]
    end

    it "cannot enroll more students in a course after reaching capacity" do
      ethan = Student.new({name: "Ethan", age: 28})

      @course.enroll(@morgan)
      @course.enroll(@jordan)

      expect(@course.students).to eq [@morgan, @jordan]

      @course.enroll(ethan)

      expect(@course.students).to eq [@morgan, @jordan]
    end
  end

  describe "#full?" do
    it "can return a boolean if a course has reached its capacity" do
      expect(@course.full?).to be false
      
      @course.enroll(@morgan)
      
      expect(@course.full?).to be false
      
      @course.enroll(@jordan)

      expect(@course.full?).to be true
    end
  end
end