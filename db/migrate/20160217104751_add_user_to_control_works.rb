class AddUserToControlWorks < ActiveRecord::Migration
  def change
    add_reference :control_works, :user, index: true, foreign_key: true
  end
end
