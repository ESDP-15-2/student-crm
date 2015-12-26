class AddTempToContactList < ActiveRecord::Migration
  def change
    add_column :contact_lists, :temp, :boolean, default: false
  end
end
