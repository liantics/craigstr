class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
      t.integer :post_id, null: false 
      t.integer :category_id, null: false
      t.timestamps null:false
    end
    add_index :post_categories, [:post_id, :category_id], unique: true 
  end
end
