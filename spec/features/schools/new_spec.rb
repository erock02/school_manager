require 'rails_helper'

RSpec.describe 'when I visit school page', type: :feature do
  it 'I can fill out form and create new school' do
    visit '/schools'
    click_link 'New School'
    expect(current_path).to eq('/schools/new')

    fill_in 'school_name', with: 'WWU'
    fill_in 'school_address', with: '516 High St.'
    fill_in 'active', with: 'true'
    click_on "Create School"

    expect(current_path).to eq('/schools')
    expect(page).to have_content('WWU')
  end
end
