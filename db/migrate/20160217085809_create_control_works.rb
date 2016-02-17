class CreateControlWorks < ActiveRecord::Migration
  def change
    create_table :control_works do |t|
      t.sting :title
      t.decimal :rating
      t.text :review

      t.timestamps null: false
    end
  end
end
