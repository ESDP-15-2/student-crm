class Contact < ActiveRecord::Base
  belongs_to :user

  validates :phone,
            presence: true,
            format: {with: /\A(996)([0-9]{9})\z/,
            message: '???????? ??????'}

  validates :additional_phone,
            format: {with: /\A(996)([0-9]{9})\z/,
            message: '???????? ??????'},
            allow_blank: true

  validates :skype, presence: true
end
