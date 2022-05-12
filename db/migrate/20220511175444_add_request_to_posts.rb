class AddRequestToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :request, :text
  end
end
