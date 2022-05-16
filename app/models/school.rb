class School < ApplicationRecord
  has_many :students
  validates_presence_of :school_name, :school_address
  validates :active, inclusion: [true, false]

  def student_count
    self.students.count
  end

  def self.most_recent
    order(created_at: :desc)
  end
end
