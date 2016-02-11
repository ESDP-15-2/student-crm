class AddHwDeadlineToPeriod < ActiveRecord::Migration
  def change
    add_column :periods, :hw_deadline, :datetime
  end
end
