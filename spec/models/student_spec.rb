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
end
