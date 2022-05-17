require 'rails_helper'

RSpec.describe 'when I visit school page', type: :feature do
  it 'I can click a link to update a school' do
    school1 = School.create!( school_name: 'WWU',
                              school_address: '516 High st.',
                              active: true)
    visit '/schools'
    expect(page).to have_content('WWU')
    click_link 'Update School'
    expect(current_path).to eq("/schools/#{school1.id}/edit")

    fill_in 'school_name', with: 'SHS'
    fill_in 'school_address', with: '123 abc st.'
    fill_in 'active', with: 'false'
    click_on "Update School"
    expect(current_path).to eq('/schools')
    expect(page).to have_content('SHS')
    expect(page).to have_content('123 abc st.')
    expect(page).to_not have_content('WWU')
  end
end
