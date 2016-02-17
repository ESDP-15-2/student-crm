class AddGroupToControlWork < ActiveRecord::Migration
  def change
    add_reference :control_works, :group, index: true, foreign_key: true
  end
end
