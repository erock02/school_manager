require 'rails_helper'

RSpec.describe 'student show page', type: :feature do
  it 'can see a student page and info' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true)
    student1 = school1.students.create!( student_name: 'Ice Cube',
                                age: 52,
                                frl: true)

    visit "/students/#{student1.id}"

    expect(page).to have_content(student1.student_name)
    expect(page).to have_content("School ID: #{student1.school_id}")
    expect(page).to have_content("Student Age: #{student1.age}")
    expect(page).to have_content("FRL: #{student1.frl}")
    expect(page).to have_content("created at: #{student1.created_at}")
    expect(page).to have_content("updated at: #{student1.updated_at}")

  end

  it 'as a visitor I can fill out form to edit student attributes' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true)
    student1 = school1.students.create!( student_name: 'Ice Cube',
                                age: 52,
                                frl: true)
    visit "/students/#{student1.id}"
    click_link 'Update Student'
    expect(current_path).to eq("/students/#{student1.id}/edit")

    fill_in 'student_name', with: 'Dr. Dre'
    fill_in 'age', with: 57
    fill_in 'frl', with: 'false'
    click_on "Update Student"

    expect(current_path).to eq("/students/#{student1.id}")
    expect(page).to have_content('Dr. Dre')
    expect(page).to_not have_content('Ice Cube')
  end
end
