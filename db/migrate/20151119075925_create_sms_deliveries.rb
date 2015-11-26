class CreateSmsDeliveries < ActiveRecord::Migration
  def change
    create_table :sms_deliveries do |t|
      t.string :title
      t.text :content
      t.references :sender, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
