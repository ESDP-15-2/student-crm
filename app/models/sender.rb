class Sender < ActiveRecord::Base
  belongs_to :sms_service_account
  has_many :sms_deliveries

  validates :name, presence: true, length: {maximum: 14}
  validates :sms_service_account, presence: true
end
