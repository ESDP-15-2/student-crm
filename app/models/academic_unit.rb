class AcademicUnit < ActiveRecord::Base
  has_many :periods
  belongs_to :group
end
