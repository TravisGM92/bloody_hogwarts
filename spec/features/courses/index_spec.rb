require 'rails_helper'

describe "As a visitor," do
  describe "When I visit '/courses'" do
    it "I see a list of courses and the number of students enrolled in each course" do

      course_1 = Course.create!(name: "Defense Against the Mold")
      course_2 = Course.create!(name: "Lotions and Gloves")
      course_3 = Course.create!(name: "Doorology")

      student_1 = Student.create!(name: 'Georgy', age: 15, house: 'SnubblePuff')
      student_2 = Student.create!(name: 'Tarry', age: 22, house: 'TickleDoor')

      StudentCourse.create!(student_id: student_1.id, course_id: course_1.id)
      StudentCourse.create!(student_id: student_1.id, course_id: course_2.id)
      StudentCourse.create!(student_id: student_1.id, course_id: course_3.id)

      StudentCourse.create!(student_id: student_2.id, course_id: course_1.id)


      visit "/courses"

      within("#course-#{course_1.id}") do
        expect(page).to have_content(2)
      end

      within("#course-#{course_2.id}") do
        expect(page).to have_content(1)
      end

      within("#course-#{course_3.id}") do
        expect(page).to have_content(1)
      end
    end
  end
end
