class AddCwDeadlineToPeriod < ActiveRecord::Migration
  def change
    add_column :periods, :cw_deadline, :datetime
  end
end
