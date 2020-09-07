require 'rails_helper'

describe "As a visitor," do
  describe "When I visit '/students/:id'" do
    it "I see a list of that students' courses" do
      course_1 = Course.create!(name: "Defense Against the Mold")
      course_2 = Course.create!(name: "Lotions and Gloves")
      course_3 = Course.create!(name: "Doorology")

      student_1 = Student.create!(name: 'Georgy', age: 15, house: 'SnubblePuff')
      student_2 = Student.create!(name: 'Tarry', age: 22, house: 'TickleDoor')

      StudentCourse.create!(student_id: student_1.id, course_id: course_1.id)
      StudentCourse.create!(student_id: student_1.id, course_id: course_2.id)
      StudentCourse.create!(student_id: student_1.id, course_id: course_3.id)


      visit "/students/#{student_1.id}"

      expect(page).to have_content(course_1.name)
      expect(page).to have_content(course_2.name)
      expect(page).to have_content(course_3.name)
    end
  end
end
