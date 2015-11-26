class SmsServiceAccount < ActiveRecord::Base

  has_many :senders
  accepts_nested_attributes_for :senders, reject_if: :all_blank, allow_destroy: true

  validates :login, presence: true, uniqueness: true
  validates :password, presence: true

end
