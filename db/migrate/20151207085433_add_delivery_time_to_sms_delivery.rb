class AddDeliveryTimeToSmsDelivery < ActiveRecord::Migration
  def change
    add_column :sms_deliveries, :delivery_time, :datetime
  end
end
