require 'rails_helper'

RSpec.describe 'school index page', type: :feature do
  it 'can see all schools and school info' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true)
    school2 = School.create!( school_name: 'Harrison MS',
                              school_address: '456 def ln',
                              active: false)
    visit "/schools"

    expect(page).to have_content(school1.school_name)
    expect(page).to have_content("address: #{school1.school_address}")
    expect(page).to have_content("created at: #{school1.created_at}")
    expect(page).to have_content("updated at: #{school1.updated_at}")
    expect(page).to have_content("active: #{school1.active}")
    expect(page).to have_content(school2.school_name)
    expect(page).to have_content("address: #{school2.school_address}")
    expect(page).to have_content("created at: #{school2.created_at}")
    expect(page).to have_content("updated at: #{school2.updated_at}")
    expect(page).to have_content("active: #{school2.active}")
  end

  it 'each page has school index link' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true)
    student1 = school1.students.create!( student_name: 'Ice Cube',
                                age: 52,
                                frl: true)
    visit "/"
    expect(page).to have_link("Schools", href: "/schools")
    visit "/students"
    expect(page).to have_link("Schools", href: "/schools")
    visit "/schools/#{school1.id}"
    expect(page).to have_link("Schools", href: "/schools")
    visit "/students/#{student1.id}"
    expect(page).to have_link("Schools", href: "/schools")
  end

  it 'each school has an edit button' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true)
    school2 = School.create!( school_name: 'Harrison MS',
                              school_address: '456 def ln',
                              active: false)
    visit "/schools"
    expect(page).to have_link("Update School", href: "/schools/#{school1.id}/edit")
    expect(page).to have_link("Update School", href: "/schools/#{school2.id}/edit")
  end

  it 'each school has an delete button' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true)
    school2 = School.create!( school_name: 'Harrison MS',
                              school_address: '456 def ln',
                              active: false)
    visit "/schools"
    expect(page).to have_link("Delete School", href: "/schools/#{school1.id}")
    expect(page).to have_link("Delete School", href: "/schools/#{school2.id}")
  end
end
