require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do
  before do
    @gradebook = Gradebook.new("Ethan")

    # Courses
    @calculus = Course.new("Calculus", 2)
    @philosophy = Course.new("Philosophy", 3)

    # Calculus Students
    @newton = Student.new({name: "Isaac Newton", age: 381})
    @turing = Student.new({name: "Alan Turing", age: 110})

    # Philosophy Students
    @plato = Student.new({name: "Plato", age: 2451})
    @aristotle = Student.new({name: "Aristotle", age: 2407})
    @kant = Student.new({name: "Immanuel Kant", age: 299})
  end

  describe "#initialize" do
    it "exists and has readable attributes" do
      expect(@gradebook).to be_a Gradebook
      expect(@gradebook.instructor).to eq "Ethan"
      expect(@gradebook.courses).to eq []
    end
  end

  

end