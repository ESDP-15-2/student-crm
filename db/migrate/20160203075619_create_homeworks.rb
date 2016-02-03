class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.text :review
      t.decimal :rating

      t.timestamps null: false
    end
  end
end
