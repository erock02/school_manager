require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'validations' do
    it { should validate_presence_of :student_name}
    it { should validate_presence_of :school_id}
    it { should validate_presence_of :age}
    it { should allow_value(true).for(:frl)}
    it { should allow_value(false).for(:frl)}
  end

  describe 'relationships' do
    it { should belong_to :school}
  end

  describe 'only display students where frl is true' do
    it 'school can count number of students' do
      school1 = School.create!( school_name: 'SHS',
                                school_address: '123 abc st.',
                                active: true)
      student1 = Student.create!( student_name: 'Ice Cube',
                                  school_id: school1.id,
                                  age: 52,
                                  frl: true)
      student2 = Student.create!( student_name: 'Harry Styles',
                                  school_id: school1.id,
                                  age: 28,
                                  frl: false)
      student3 = Student.create!( student_name: 'James Franco',
                                  school_id: school1.id,
                                  age: 44,
                                  frl: true)

      expect(Student.filter_frl).to eq([student1, student3])
    end
  end
end
