class PostRequests < ActiveRecord::Migration[6.1]
  def change
    drop_table :post_requests
  end
end
