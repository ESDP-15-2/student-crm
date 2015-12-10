class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :group_memberships
  has_many :groups, through: :group_memberships

  has_many :attendances
  has_many :periods, through: :attendances

  has_many :recipient_depositories
  has_many :contact_lists, through: :recipient_depositories

  has_one :contact, dependent: :destroy
  accepts_nested_attributes_for :contact

  after_initialize do
    self.contact ||= self.build_contact()
  end
end
