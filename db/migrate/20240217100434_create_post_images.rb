class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|

      #8章で追加したカラム下記3行↓
      t.string :shop_name
      t.text :caption
      t.integer :user_id


      t.timestamps
    end
  end
end
