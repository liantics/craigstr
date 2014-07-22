class RenameLocationLocationToName < ActiveRecord::Migration
  def change
    rename_column :locations, :location, :name
  end
end
