class StudentsController < ApplicationController
  def index
    @students = Student.all
    studs = StudentStats.new(@students)
    @average = studs.average_age
    @sorted_students = studs.sorted
  end

  def show
    @student = Student.find(params[:id])
  end


  def create
    Student.create(student_params)
  end

  private
  def student_params
    params.permit(:name, :age, :house)
  end
end
