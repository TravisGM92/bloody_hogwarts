require 'rails_helper'

describe "As a visitor," do
  describe "When I visit '/students'" do
    it "I see a list of students with their name, age and house" do
      student_1 = Student.create!(name: 'Georgy', age: 15, house: 'SnubblePuff')
      student_2 = Student.create!(name: 'Tarry', age: 22, house: 'TickleDoor')

      visit "/students"

        within("#student-#{student_1.id}-1") do
          expect(page).to have_content(student_1.name)
          expect(page).to have_content(student_1.age)
          expect(page).to have_content(student_1.house)
        end
    end

    it "When I visit '/students' I see the average age of all students" do
      student_1 = Student.create!(name: 'Georgy', age: 15, house: 'SnubblePuff')
      student_2 = Student.create!(name: 'Tarry', age: 22, house: 'TickleDoor')
      visit "/students"

      avg = Student.all.average(:age).to_f.round(1)


      expect(page).to have_content("Average age: #{avg}")
    end

    it "Students names are in alphabetical order" do
      student_1 = Student.create!(name: 'Georgy Hamilton', age: 15, house: 'SnubblePuff')
      student_2 = Student.create!(name: 'Tarry Fields', age: 17, house: 'TickleDoor')
      student_3 = Student.create!(name: 'Alta Lang', age: 20, house: 'SnubblePuff')
      student_4 = Student.create!(name: 'Yessuf Hasfitil', age: 12, house: 'TickleDoor')
      student_5 = Student.create!(name: 'Barabra Davis', age: 14, house: 'SnubblePuff')
      student_6 = Student.create!(name: 'Ludwig Von Behloven', age: 52, house: 'TickleDoor')
      visit "/students"


      within("#student-#{student_3.id}-1") do
        expect(page).to have_content("student: #{student_3.name}")
      end
      within("#student-#{student_5.id}-2") do
        expect(page).to have_content("student: #{student_5.name}")
      end

      within("#student-#{student_1.id}-3") do
        expect(page).to have_content("student: #{student_1.name}")
      end
      within("#student-#{student_6.id}-4") do
        expect(page).to have_content("student: #{student_6.name}")
      end
      within("#student-#{student_2.id}-5") do
        expect(page).to have_content("student: #{student_2.name}")
      end
      within("#student-#{student_4.id}-6") do
        expect(page).to have_content("student: #{student_4.name}")
      end
    end
  end
end
