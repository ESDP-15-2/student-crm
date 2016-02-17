class AddCwStatusToPeriod < ActiveRecord::Migration
  def change
    add_column :periods, :cw_status, :boolean, default: false
  end
end
