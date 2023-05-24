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

  
end