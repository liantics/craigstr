class AddLocationsToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :location, index: true, null: false
  end
end
