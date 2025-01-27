class Course
  attr_reader :name, :capacity, :students

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @students = []
  end

  def enroll(student)
    return nil if !student.is_a?(Student)
    return nil if full?

    @students << student
  end

  def full?
    @students.length == capacity
  end
end
