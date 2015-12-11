class ContactList < ActiveRecord::Base
  has_many :recipient_depositories
  has_many :users, through: :recipient_depositories
  has_many :sms_deliveries, dependent: :destroy

  validates :title, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :users, presence: true
end
