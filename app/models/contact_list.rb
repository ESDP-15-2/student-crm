class ContactList < ActiveRecord::Base
  has_many :recipient_depositories
  has_many :students, through: :recipient_depositories
  has_many :sms_deliveries, dependent: :destroy

  validates :title, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :students, presence: true
end
