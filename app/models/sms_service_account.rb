class SmsServiceAccount < ActiveRecord::Base
  has_many :senders,  dependent: :destroy

  validates :login, presence: true, uniqueness: true
  validates :password, presence: true
end
