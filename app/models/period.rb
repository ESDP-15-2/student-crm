class Period < ActiveRecord::Base
  belongs_to :course_element
  belongs_to :academic_unit
  belongs_to :group
  belongs_to :course

  has_many :attendances
  has_many :homeworks
  has_many :students, through: :attendances
end
