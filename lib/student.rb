class Student
  attr_reader :name, :age, :scores

  def initialize(info_hash)
    @name = info_hash[:name]
    @age = info_hash[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end
end
