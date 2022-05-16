require 'rails_helper'

RSpec.describe 'student index page', type: :feature do
  it 'can see all students and students info' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true)
    student1 = Student.create!( student_name: 'Ice Cube',
                                school_id: school1.id,
                                age: 52,
                                frl: true)
    student2 = Student.create!( student_name: 'Harry Styles',
                                school_id: school1.id,
                                age: 28,
                                frl: false)
    visit "/students"

    expect(page).to have_content(student1.student_name)
    expect(page).to have_content("School ID: #{student1.school_id}")
    expect(page).to have_content("student age: #{student1.age}")
    expect(page).to have_content("FRL: #{student1.frl}")
    expect(page).to have_content("created at: #{student1.created_at}")
    expect(page).to have_content("updated at: #{student1.updated_at}")
    expect(page).to have_content(student2.student_name)
    expect(page).to have_content("School ID: #{student2.school_id}")
    expect(page).to have_content("student age: #{student2.age}")
    expect(page).to have_content("FRL: #{student2.frl}")
    expect(page).to have_content("created at: #{student2.created_at}")
    expect(page).to have_content("updated at: #{student2.updated_at}")
  end

  it 'each page has student index link' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true)
    student1 = Student.create!( student_name: 'Ice Cube',
                                school_id: school1.id,
                                age: 52,
                                frl: true)
    visit "/"
    expect(page).to have_link("Student Index", href: "/students")
    visit "/schools"
    expect(page).to have_link("Student Index", href: "/students")
    visit "/schools/#{school1.id}"
    expect(page).to have_link("Student Index", href: "/students")
    visit "/students/#{student1.id}"
    expect(page).to have_link("Student Index", href: "/students")
  end
end
