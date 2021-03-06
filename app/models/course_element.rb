class CourseElement < ActiveRecord::Base
  belongs_to :course
  has_many :periods

  validates :theme, presence: true
  validates :course, presence: true
end
