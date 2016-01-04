class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable#, :registerable

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  has_many :attendances
  has_many :periods, through: :attendances

  has_many :recipient_depositories
  has_many :contact_lists, through: :recipient_depositories

  has_one :contact, dependent: :destroy
  accepts_nested_attributes_for :contact

  has_attached_file :photo,
                    styles: { medium: '300x300>', thumb: '100x100>'},
                    default_url: '/images/:style/missing_photo.png'
  validates_attachment_content_type :photo,
                                    content_type: ['image/jpeg', 'image/gif', 'image/png']

  has_attached_file :passport_scan_copy,
                    styles: { medium: '300x300>', thumb: '100x100>'},
                    default_url: '/images/:style/missing_passport_scan_copy.png'
  validates_attachment_content_type :passport_scan_copy,
                                    content_type: ['image/jpeg', 'image/gif', 'image/png']


  after_initialize do
    self.contact ||= self.build_contact()
  end

  validates :name, :surname, :passport_data, presence: true
  validates :email, format: { with: /@gmail\.com\z/, message: 'Используйте gmail почту' }

  def full_name
    "#{name} #{surname}"
  end
end
