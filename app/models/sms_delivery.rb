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

  def build_message
    Nokogiri::XML::Builder.new do |xml|
      xml.message {
        xml.login(sender.sms_service_account.login)
        xml.pwd(sender.sms_service_account.password)
        xml.id(id.to_s + 'esdp1502')
        xml.sender(sender.name)
        xml.text_ content
        xml.phones {
          contact_list.students.each do |student|
            xml.phone(student.phone)
          end
        }
      }
    end
  end

  def build_report
    Nokogiri::XML::Builder.new do |xml|
      xml.dr {
        xml.login('aisma')
        xml.pwd('kiminitodoke')
        xml.id(id.to_s + 'esdp1502')
      }
    end
  end

  private

  def fill_title
    if self.title.blank?
      self.title = self.content[0, 49]
    end
  end
end
