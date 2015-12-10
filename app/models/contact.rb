class Contact < ActiveRecord::Base
  belongs_to :user

  validates :phone, presence: true
  validates :skype, presence: true
end
