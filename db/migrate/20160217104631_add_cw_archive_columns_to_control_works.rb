class AddCwArchiveColumnsToControlWorks < ActiveRecord::Migration
  def up
    add_attachment :control_works, :cw_archive
  end

  def down
    remove_attachment :control_works, :cw_archive
  end
end
