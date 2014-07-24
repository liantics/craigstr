class AddColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :location_id, :integer, null: false, default: 1
  end
end
