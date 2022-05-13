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
end
