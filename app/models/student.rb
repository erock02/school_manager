class Student < ApplicationRecord
  validates_presence_of :student_name, :school_id, :age
  validates :frl, inclusion: [true, false]
end
