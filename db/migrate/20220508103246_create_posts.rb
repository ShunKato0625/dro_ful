class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table   :posts do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :prefecture, null: false, foreign_key: true
      t.references :request, null: false, foreign_key: true
      t.string     :title
      t.text       :access
      t.text       :authorization
      t.integer    :drone_type
      t.text       :remarks
      t.float      :rate
      t.integer    :impressions_count, default: 0
      t.boolean    :is_active, default: true
      t.date       :shooting_date
      
      t.timestamps
    end
  end
end
