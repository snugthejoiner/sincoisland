class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.integer :x
      t.integer :y
      t.integer :population
      t.text :note

      t.timestamps null: false
    end
  end
end
