class CreateCourseElements < ActiveRecord::Migration
  def change
    create_table :course_elements do |t|
      t.references :course, index: true, foreign_key: true
      t.string :theme
      t.string :element_type
      t.date :date_for_theme
      t.boolean :home_work
      t.date :date_for_hw

      t.timestamps null: false
    end
  end
end
