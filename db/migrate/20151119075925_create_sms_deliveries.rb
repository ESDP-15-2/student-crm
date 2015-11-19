class CreateSmsDeliveries < ActiveRecord::Migration
  def change
    create_table :sms_deliveries do |t|
      t.string :title
      t.string :author
      t.text :content

      t.timestamps null: false
    end
  end
end
