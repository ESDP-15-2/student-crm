class SmsDelivery < ActiveRecord::Base
  belongs_to :contact_list

  validates :title, presence: true,
            length: {maximum: 50}

  validates :author, presence: true,
            length: { maximum: 50}

  validates :content, presence: true

end
