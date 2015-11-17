class ContactList < ActiveRecord::Base
  has_many :recipient_depositories
  has_many :students, through: :recipient_depositories

  validates :title, :presence => true
  validates :title, :uniqueness => true
  validates :title, :length => { :maximum => 50 }
end
