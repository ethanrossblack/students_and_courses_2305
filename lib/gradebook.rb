class Gradebook
  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    return nil if !course.is_a?(Course)

    @courses << course
  end

  def list_all_students
    hash = {}

    @courses.each do |course|
      hash[course] = course.students
    end

    hash
  end

  def students_below(threshold)
    students = @courses.map do |course|
      course.students.map do |student|
        student if student.grade < threshold
      end
    end

    students.flatten.compact
  end

end
