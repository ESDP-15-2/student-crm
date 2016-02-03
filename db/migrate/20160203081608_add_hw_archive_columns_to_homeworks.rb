class AddHwArchiveColumnsToHomeworks < ActiveRecord::Migration

  def up
    add_attachment :homeworks, :hw_archive
  end

  def down
    remove_attachment :homeworks, :hw_archive
  end

end
