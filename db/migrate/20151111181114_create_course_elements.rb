class CreateCourseElements < ActiveRecord::Migration
  def change
    create_table :course_elements do |t|
      t.references :course, index: true, foreign_key: true
      t.string :theme
      t.timestamps null: false
    end
  end
end
