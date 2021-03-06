class Period < ActiveRecord::Base
  belongs_to :course_element
  belongs_to :academic_unit
  belongs_to :course
  belongs_to :group
  has_many :attendances
  has_many :homeworks
  has_many :control_works
  has_many :students, through: :attendances

  TYPES = %w(Лекция Вебинар Контрольная Лабораторная Другое)
end
