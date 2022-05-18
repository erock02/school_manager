describe 'destorying a student record', type: :feature do
  it 'I can click a link to delete a student' do
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
    visit "/students/#{student1.id}"

    expect(page).to have_content('Ice Cube')

    click_link 'Delete Student'

    expect(current_path).to eq("/students")
    expect(page).to have_content('Harry Styles')
    expect(page).to_not have_content('Ice Cube')

  end
end
