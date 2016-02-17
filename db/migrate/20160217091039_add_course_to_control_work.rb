class AddCourseToControlWork < ActiveRecord::Migration
  def change
    add_reference :control_works, :course, index: true, foreign_key: true
  end
end
