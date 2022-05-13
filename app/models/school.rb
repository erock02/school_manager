class School < ApplicationRecord
  has_many :students
  validates_presence_of :school_name, :school_address
  validates :active, inclusion: [true, false]
end
