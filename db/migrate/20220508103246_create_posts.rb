class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table   :posts do |t|
      t.integer    :customer_id
      t.integer    :prefecture_id
      t.string     :title
      t.text       :access
      t.text       :authorization
      t.string     :drone_type
      t.string     :request
      t.text       :remarks
      t.float      :rate
      t.integer    :impressions_count, default: 0
      t.boolean    :is_active, default: true
      t.date       :shooting_date

      t.timestamps
    end
  end
end
