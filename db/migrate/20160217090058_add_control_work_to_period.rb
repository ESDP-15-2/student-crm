class AddControlWorkToPeriod < ActiveRecord::Migration
  def change
    add_reference :periods, :control_work, index: true, foreign_key: true
  end
end
