class Student < ApplicationRecord
  belongs_to :school
  validates_presence_of :student_name, :school_id, :age
  validates :frl, inclusion: [true, false]

  def self.filter_frl
    where("frl = true")
  end
end
