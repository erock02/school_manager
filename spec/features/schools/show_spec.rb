require 'rails_helper'

RSpec.describe 'school show page', type: :feature do
  it 'can see a school page and info' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true)
    visit "/schools/#{school1.id}"

    expect(page).to have_content(school1.school_name)
    expect(page).to have_content("Address: #{school1.school_address}")
    expect(page).to have_content("Created At: #{school1.created_at}")
    expect(page).to have_content("Updated At: #{school1.updated_at}")
    expect(page).to have_content("Active: #{school1.active}")
  end

  it 'can see count of students at school ' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true)
    school2 = School.create!( school_name: 'GHS',
                              school_address: '456 def st.',
                              active: true)
    student1 = school1.students.create!( student_name: 'Ice Cube',
                                school_id: school1.id,
                                age: 52,
                                frl: true)
    student2 = school2.students.create!( student_name: 'Harry Styles',
                                school_id: school2.id,
                                age: 28,
                                frl: false)
    student3 = school1.students.create!( student_name: 'James Franco',
                                school_id: school1.id,
                                age: 44,
                                frl: false)

    visit "/schools/#{school1.id}"
    expect(page).to have_content("Student Count: #{school1.student_count}")

    visit "/schools/#{school2.id}"
    expect(page).to have_content("Student Count: #{school2.student_count}")
  end

  it 'has update school link' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true)
    school2 = School.create!( school_name: 'GHS',
      school_address: '456 def st.',
      active: true)
    visit "/schools/#{school1.id}"
    expect(page).to have_link("Update School", href: "/schools/#{school1.id}/edit")

    visit "/schools/#{school2.id}"
    expect(page).to have_link("Update School", href: "/schools/#{school2.id}/edit")

  end
end
