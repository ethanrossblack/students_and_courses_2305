class Student
  attr_reader :name, :age

  def initialize(info_hash)
    @name = info_hash[:name]
    @age = info_hash[:age]
  end
end
