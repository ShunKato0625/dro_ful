class RemoveIsActiveFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :is_active, :boolean
  end
end
