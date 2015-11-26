require 'builder'

class SmsDelivery < ActiveRecord::Base
  belongs_to :contact_list
  belongs_to :sender

  before_validation :fill_title

  validates :title, presence: true,
            length: { maximum: 50 }

  validates :content, presence: true,
            length: { maximum: 800 }

  validates :contact_list, presence: true
  validates :sender, presence: true

  def to_xml
    xml = ::Builder::XmlMarkup.new
    xml.instruct!
    xml.message{
      xml.login('aisma')
      xml.pwd('kiminitodoke')
      xml.id(Faker::Internet.password(12))
      xml.sender('K2, ESDP')
      xml.text(" #{content} ")
      xml.phones{
        contact_list.students.each do |student|
          xml.phone("#{student.phone}")
        end
      }
    }

  end

  private

  def fill_title
    if self.title.blank?
      self.title = self.content[0, 49]
    end
  end
end
