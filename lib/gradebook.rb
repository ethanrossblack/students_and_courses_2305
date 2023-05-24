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

end
