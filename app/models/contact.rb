class Contact < ActiveRecord::Base
  belongs_to :user

  validates :phone,
            presence: true,
            format: {with: /\A(996)([0-9]{9})\z/}

  validates :additional_phone,
            format: {with: /\A(996)([0-9]{9})\z/},
            allow_blank: true

  validates :skype, presence: true
end
