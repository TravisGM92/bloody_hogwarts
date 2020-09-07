class Course < ApplicationRecord
  validates_presence_of :name

  has_many :student_courses
  has_many :students, through: :student_courses
  
  def number_of_students
    self.students.count
  end
end
