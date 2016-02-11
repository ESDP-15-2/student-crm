class CreateAcademicUnits < ActiveRecord::Migration
  def change
    create_table :academic_units do |t|
      t.string :title
      t.date :starts_at
      t.date :ends_at

      t.timestamps null: false
    end
  end
end
