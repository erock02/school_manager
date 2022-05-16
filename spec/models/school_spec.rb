require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'validations' do
    it { should validate_presence_of :school_name}
    it { should validate_presence_of :school_address}
    it { should allow_value(true).for(:active)}
    it { should allow_value(false).for(:active)}
  end

  describe 'relationships' do
    it { should have_many :students}
  end

  describe 'count relationships' do
    it 'school can count number of students' do
      school1 = School.create!( school_name: 'SHS',
                                school_address: '123 abc st.',
                                active: true)
      school2 = School.create!( school_name: 'GHS',
                                school_address: '456 def st.',
                                active: true)
      student1 = Student.create!( student_name: 'Ice Cube',
                                  school_id: school1.id,
                                  age: 52,
                                  frl: true)
      student2 = Student.create!( student_name: 'Harry Styles',
                                  school_id: school2.id,
                                  age: 28,
                                  frl: false)
      student3 = Student.create!( student_name: 'James Franco',
                                  school_id: school1.id,
                                  age: 44,
                                  frl: false)

      expect(school1.student_count).to eq(2)
      expect(school2.student_count).to eq(1)
    end
  end

  it 'can sort schools by most recent' do
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
    expect(School.most_recent).to eq([school4, school3, school2, school1])
  end
end
