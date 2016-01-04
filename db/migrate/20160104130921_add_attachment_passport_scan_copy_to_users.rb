class AddAttachmentPassportScanCopyToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :passport_scan_copy
    end
  end

  def self.down
    remove_attachment :users, :passport_scan_copy
  end
end
