class AddContactListToCustomList < ActiveRecord::Migration
  def change
    add_reference :custom_lists, :contact_list, index: true, foreign_key: true
  end
end
