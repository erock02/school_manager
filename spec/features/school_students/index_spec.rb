require 'rails_helper'

RSpec.describe 'students that belong to a school index page', type: :feature do
  it 'can see all students that belong to a school' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true)
    school2 = School.create!( school_name: 'GHS',
                              school_address: '456 def st.',
                              active: true)
    student1 = school1.students.create!( student_name: 'Ice Cube',
                                age: 52,
                                frl: true)
    student2 = school2.students.create!( student_name: 'Harry Styles',
                                age: 28,
                                frl: false)
    student3 = school1.students.create!( student_name: 'James Franco',
                                age: 44,
                                frl: false)
    visit "/schools/#{school1.id}/students"

    expect(page).to have_content(student1.student_name)
    expect(page).to have_content("School ID: #{student1.school_id}")
    expect(page).to have_content("student age: #{student1.age}")
    expect(page).to have_content("FRL: #{student1.frl}")
    expect(page).to have_content("created at: #{student1.created_at}")
    expect(page).to have_content("updated at: #{student1.updated_at}")
    expect(page).to have_content(student3.student_name)
    expect(page).to have_content("School ID: #{student3.school_id}")
    expect(page).to have_content("student age: #{student3.age}")
    expect(page).to have_content("FRL: #{student3.frl}")
    expect(page).to have_content("created at: #{student3.created_at}")
    expect(page).to have_content("updated at: #{student3.updated_at}")
  end

  describe 'as a visitor' do
    it 'can click a link to adopt a student' do
      school1 = School.create!( school_name: 'SHS',
                                school_address: '123 abc st.',
                                active: true)

      visit "/schools/#{school1.id}/students"

      click_link 'Create Student'

      expect(current_path).to eq("/schools/#{school1.id}/students/new")

      fill_in 'student_name', with: 'Denzel Washington'
      fill_in 'age', with: 67
      fill_in 'frl', with: 'false'
      click_on "Create Student"
      expect(current_path).to eq("/schools/#{school1.id}/students")
      expect(page).to have_content('Denzel Washington')
      expect(page).to have_content(67)
      expect(page).to have_content(false)
      expect(page).to_not have_content(true)

    end

    it 'can click button and sort students alphabetically' do
      school1 = School.create!( school_name: 'SHS',
                                school_address: '123 abc st.',
                                active: true)
      student1 = school1.students.create!(student_name: 'James Franco',
                                          age: 44,
                                          frl: true)
      student2 = school1.students.create!(student_name: 'Harry Styles',
                                          age: 28,
                                          frl: true)
      student3 = school1.students.create!(student_name: 'Ice Cube',
        age: 52,
        frl: true)

      visit "/schools/#{school1.id}/students"
      within("#school_student-0") do
        expect(page).to have_content("James Franco")
      end
      within("#school_student-1") do
        expect(page).to have_content("Harry Styles")
      end
      within("#school_student-2") do
        expect(page).to have_content("Ice Cube")
      end

      click_button 'Sort Students'

      within("#school_student-0") do
        expect(page).to have_content("Harry Styles")
      end
      within("#school_student-1") do
        expect(page).to have_content("Ice Cube")
      end
      within("#school_student-2") do
        expect(page).to have_content("James Franco")
      end

    end

    it 'can fill form and filter by age' do
      school1 = School.create!( school_name: 'SHS',
                                school_address: '123 abc st.',
                                active: true)
      student1 = school1.students.create!(student_name: 'James Franco',
                                          age: 44,
                                          frl: true)
      student2 = school1.students.create!(student_name: 'Harry Styles',
                                          age: 28,
                                          frl: true)
      student3 = school1.students.create!(student_name: 'Ice Cube',
        age: 52,
        frl: true)

      visit "/schools/#{school1.id}/students"
      within("#school_student-0") do
        expect(page).to have_content("James Franco")
      end
      within("#school_student-1") do
        expect(page).to have_content("Harry Styles")
      end
      within("#school_student-2") do
        expect(page).to have_content("Ice Cube")
      end

      fill_in 'desired_age', with: 30

      click_button 'Only return records with more than this many years of age'

      within("#school_student-0") do
        expect(page).to have_content("James Franco")
      end
      within("#school_student-1") do
        expect(page).to have_content("Ice Cube")
      end

    end
  end
end
