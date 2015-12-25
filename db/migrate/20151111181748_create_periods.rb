class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.references :course_elements, index: true, foreign_key: true
      t.string :title
      t.datetime :commence_datetime

      t.timestamps null: false
    end
  end
end
