class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location, null: false

      t.timestamps null: false
    end

    add_index :locations, [:location], unique: true
  end
end
