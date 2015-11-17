class CreateContactLists < ActiveRecord::Migration
  def change
    create_table :contact_lists do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
