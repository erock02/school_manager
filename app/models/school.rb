class School < ApplicationRecord
  validates_presence_of :school_name, :school_address
  validates :active, inclusion: [true, false]
end
