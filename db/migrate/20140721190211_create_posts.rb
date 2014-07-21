class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body, null: false
      t.string :title, null: false
      t.belongs_to :user, index: true, null: false
      t.timestamps null: false
    end
  end
end
