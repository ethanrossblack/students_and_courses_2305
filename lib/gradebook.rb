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

end
