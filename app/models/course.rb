class Course < ActiveRecord::Base
  has_many :groups
  has_many :course_elements
  has_many :periods

  validates :name, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
end
