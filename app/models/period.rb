class Period < ActiveRecord::Base
  belongs_to :course_element
  has_many :attendances
  has_many :homeworks
  has_many :students, through: :attendances
end
