class AddPricesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :price, :decimal, precision: 7, scale: 2, default: 0.00, null: false
  end
end
