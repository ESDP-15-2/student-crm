class AddHwStatusToPeriod < ActiveRecord::Migration
  def change
    add_column :periods, :hw_status, :boolean, default: false
  end
end
