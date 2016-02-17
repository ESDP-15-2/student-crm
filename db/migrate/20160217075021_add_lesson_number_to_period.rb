class AddLessonNumberToPeriod < ActiveRecord::Migration
  def change
    add_column :periods, :lesson_number, :integer
  end
end
