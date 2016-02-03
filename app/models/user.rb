class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  has_many :attendances
  has_many :periods, through: :attendances

  has_many :recipient_depositories
  has_many :contact_lists, through: :recipient_depositories

  has_one :contact, dependent: :destroy
  accepts_nested_attributes_for :contact

  has_many :homeworks

  validates :name, :surname, :passport_data, presence: true
  validates :email, format: { with: /@gmail\.com\z/ }

  has_attached_file :photo,
                    styles: { medium: '300x300>', thumb: '150x150>'},
                    default_url:  '/images/:style/no_avatar.png'
  validates_attachment_content_type :photo,
                                    content_type: ['image/jpeg', 'image/jpg', 'image/gif', 'image/png']

  has_attached_file :passport_scan_copy,
                    styles: { large: '600x600>', medium: '300x300>', thumb: '150x150>'}
  validates_attachment_content_type :passport_scan_copy,
                                    content_type: ['image/jpeg', 'image/jpg', 'image/gif', 'image/png']

  def password_required?
    new_record? ? false : super
  end

  after_initialize do
    self.contact ||= self.build_contact()
  end

  def full_name
    "#{surname} #{name}"
  end
end
