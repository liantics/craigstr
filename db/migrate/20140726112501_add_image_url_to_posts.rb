class AddImageUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_url, :string, null: false, default: ""
  end
end
