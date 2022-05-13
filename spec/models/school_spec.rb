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
end
