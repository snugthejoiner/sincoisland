class CreateLocalities < ActiveRecord::Migration
  def change
    create_table :localities do |t|
      t.string :name
      t.integer :population
      t.text :note
      t.references :county, index: true, foreign_key: true
      t.string :type

      t.timestamps null: false
    end
  end
end
