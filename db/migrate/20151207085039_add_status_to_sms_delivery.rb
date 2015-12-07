class AddStatusToSmsDelivery < ActiveRecord::Migration
  def change
    add_column :sms_deliveries, :status, :boolean, default: false
  end
end
