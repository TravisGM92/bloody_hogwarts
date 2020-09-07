class StudentStats
  attr_reader :students
  def initialize(students)
    @students = students
  end

  def average_age
    @students.average(:age).to_f.round(2)
  end

  def sorted
    @students.order(:name)
  end
end
