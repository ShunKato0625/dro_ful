class CreatePostRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :post_requests do |t|
      t.integer      :post_id
      t.integer      :request_id
      t.timestamps
    end
  end
end
