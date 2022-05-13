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
    expect(page).to have_content("active: #{school1.active}")
    expect(page).to have_content(school2.school_name)
    expect(page).to have_content("address: #{school2.school_address}")
    expect(page).to have_content("created at: #{school2.created_at}")
    expect(page).to have_content("active: #{school2.active}")
  end
end
