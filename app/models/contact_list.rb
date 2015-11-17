class ContactList < ActiveRecord::Base
  validates :title, :presence => true
  validates :title, :uniqueness => true
  validates :title, :length => { :maximum => 50 }
end
