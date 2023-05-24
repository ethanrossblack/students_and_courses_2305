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

  def grade
    return 0.0 if @scores.length == 0

    (@scores.sum.to_f / @scores.length).round(1)
  end
end
