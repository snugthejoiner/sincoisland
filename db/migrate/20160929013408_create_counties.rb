class CreateCounties < ActiveRecord::Migration
  def change
    create_table :counties do |t|
      t.string :name
      t.integer :population
      t.text :note
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
