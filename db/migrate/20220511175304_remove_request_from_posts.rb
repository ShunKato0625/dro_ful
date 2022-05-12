class RemoveRequestFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :request, :string
  end
end
