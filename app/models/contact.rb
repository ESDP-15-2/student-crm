class Contact < ActiveRecord::Base
  belongs_to :user

  validates :phone, :skype, presence: true
  validates :phone, :additional_phone,
            format: {with: /\A(996)([0-9]{9})\z/, message: 'Phone number format must be:  996xxxyyyyyy, where xxx - code of mobile operator and yyyyyy - phone number'}
end
