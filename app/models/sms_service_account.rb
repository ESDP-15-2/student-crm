class SmsServiceAccount < ActiveRecord::Base
  validates :login, presence: true, uniqueness: true
  validates :password, presence: true
end
