class AddContactListToSmsDelivery < ActiveRecord::Migration
  def change
    add_reference :sms_deliveries, :contact_list, index: true, foreign_key: true
  end
end
