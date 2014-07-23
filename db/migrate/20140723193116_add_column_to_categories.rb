class AddColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :location_id, :integer
  end
end
