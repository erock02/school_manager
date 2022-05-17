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
end
