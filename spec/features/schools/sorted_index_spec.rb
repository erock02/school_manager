require 'rails_helper'

RSpec.describe 'students that belong to a school index page', type: :feature do
  it 'shows students in order by created_by date' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true)
    school2 = School.create!( school_name: 'GHS',
                              school_address: '456 def st.',
                              active: true)
    school3 = School.create!( school_name: 'PHS',
                              school_address: '316 elm st.',
                              active: true)
    school4 = School.create!( school_name: 'YVCC',
                              school_address: '369 dsf st.',
                              active: true)

    visit "/schools"

    within("#school-0") do
      expect(page).to have_content("YVCC")
      expect(page).to have_content("369 dsf st.")
      expect(page).to_not have_content("SHS")
    end
    within("#school-1") do
      expect(page).to have_content("PHS")
      expect(page).to have_content("316 elm st.")
      expect(page).to_not have_content("YVCC")
    end
    within("#school-2") do
      expect(page).to have_content("GHS")
      expect(page).to have_content("456 def st.")
      expect(page).to_not have_content("SHS")
    end
    within("#school-3") do
      expect(page).to have_content("SHS")
      expect(page).to have_content("123 abc st.")
      expect(page).to_not have_content("PHS")
    end

  end
end
