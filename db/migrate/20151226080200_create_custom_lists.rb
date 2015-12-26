class CreateCustomLists < ActiveRecord::Migration
  def change
    create_table :custom_lists do |t|
      t.string :phone
      t.timestamps null: false
    end
  end
end
