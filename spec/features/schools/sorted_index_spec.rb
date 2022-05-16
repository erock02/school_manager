require 'rails_helper'

RSpec.describe 'students that belong to a school index page', type: :feature do
  it 'can see all students that belong to a school' do
    school1 = School.create!( school_name: 'SHS',
                              school_address: '123 abc st.',
                              active: true,
                              created_at: 5.second.ago)
    school2 = School.create!( school_name: 'GHS',
                              school_address: '456 def st.',
                              active: true,
                              created_at: 10.second.ago)
    school3 = School.create!( school_name: 'PHS',
                              school_address: '316 elm st.',
                              active: true,
                              created_at: 2.second.ago)
    school4 = School.create!( school_name: 'YVCC',
                              school_address: '369 dsf st.',
                              active: true,
                              created_at: 4.second.ago)

    visit "/schools"

    expect(page.text.index("PHS")).to be < page.text.index("YVCC")
    expect(page.text.index("YVCC")).to be < page.text.index("SHS")
    expect(page.text.index("SHS")).to be < page.text.index("GHS")

  end
end
