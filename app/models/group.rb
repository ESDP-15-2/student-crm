class Group < ActiveRecord::Base
  validates :name, presence: true, length: {maximum:20}

  belongs_to :course
  has_many :group_memberships
  has_many :users, through: :group_memberships
end
