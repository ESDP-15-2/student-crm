class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :additional_phone
      t.string :skype

      t.timestamps null: false
    end
  end
end
