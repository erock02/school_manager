describe 'destorying a school page', type: :feature do
  it 'I can click a link to delete a school' do
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
                                frl: true)
    student3 = school1.students.create!( student_name: 'James Franco',
                                age: 44,
                                frl: true)
    visit "/schools/#{school1.id}"
    expect(page).to have_content('SHS')

    click_link 'Delete School'

    expect(current_path).to eq("/schools")
    expect(page).to have_content('GHS')
    expect(page).to_not have_content('SHS')

    visit '/students'

    expect(page).to_not have_content('Ice Cube')
    expect(page).to_not have_content('James Franco')
    expect(page).to have_content('Harry Styles')
  end
end
