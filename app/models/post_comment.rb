class PostComment < ApplicationRecord
  belongs_to :user #18章で追加(アソシエーションの設定)
  belongs_to :post_image #18章で追加
end
