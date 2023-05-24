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
    @turing = Student.new({name: "Alan Turing", age: 110})
    @turing.log_score(89)
    @turing.log_score(98)
    
    @newton = Student.new({name: "Isaac Newton", age: 381})
    @newton.log_score(78)
    @newton.log_score(92)

    @calculus.enroll(@turing)
    @calculus.enroll(@newton)
    
    # Philosophy Students
    @plato = Student.new({name: "Plato", age: 2451})
    @plato.log_score(45)
    @plato.log_score(68)

    @aristotle = Student.new({name: "Aristotle", age: 2407})
    @aristotle.log_score(79)
    @aristotle.log_score(87)

    @kant = Student.new({name: "Immanuel Kant", age: 299})
    @kant.log_score(97)
    @kant.log_score(93)

    @philosophy.enroll(@plato)
    @philosophy.enroll(@aristotle)
    @philosophy.enroll(@kant)
  end

  describe "#initialize" do
    it "exists and has readable attributes" do
      expect(@gradebook).to be_a Gradebook
      expect(@gradebook.instructor).to eq "Ethan"
      expect(@gradebook.courses).to eq []
    end
  end

  describe "#add_course" do
    it "can add a course" do
      @gradebook.add_course(@calculus)

      expect(@gradebook.courses).to eq [@calculus]

      expect(@gradebook.add_course(@philosophy)).to eq [@calculus, @philosophy]
    end

    it "can only add Course objects" do
      @gradebook.add_course(@turing)

      expect(@gradebook.courses).to eq []
    end
  end

  describe "#list_all_students" do
    before do
      @gradebook.add_course(@calculus)
      @gradebook.add_course(@philosophy)
    end

    it "returns a Hash object" do
      expect(@gradebook.list_all_students).to be_a Hash
    end

    it "uses Course objects as Hash keys" do
      return_hash = @gradebook.list_all_students

      expect(return_hash.keys.first).to be_a Course
    end


    it "uses an array of Student objects as values" do
      return_hash = @gradebook.list_all_students

      expect(return_hash.values.first).to be_a Array
      expect(return_hash.values.first.first).to be_a Student 
    end

    it "retuns a hash of Courses and Students" do
      return_hash = @gradebook.list_all_students
      expected_hash = {
        @calculus => [@turing, @newton],
        @philosophy => [@plato, @aristotle, @kant]
      }

      expect(return_hash).to be_a Hash
      expect(return_hash).to eq expected_hash
    end
  end

  describe "#students_below" do
    before do
      @gradebook.add_course(@calculus)
      @gradebook.add_course(@philosophy)
    end

    it "returns an array of Student objects" do
      students_below = @gradebook.students_below(90)

      expect(students_below).to be_a Array
      expect(students_below.first).to be_a Student
    end
    
    it "only returns students whose grade average is below the provided threshold" do
      students_below = @gradebook.students_below(90)

      expect(students_below).to eq [@newton, @plato, @aristotle]
    end
    
    it "returns an empty array if no students meet the provided threshold" do
      students_below = @gradebook.students_below(50)

      expect(students_below).to eq []
    end

  end

end