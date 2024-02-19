class PostImage < ApplicationRecord
  has_one_attached :image #7章「モデルにimageを持たせる」AvtiveStorageを使うのにこの記述の追加が必要。
  belongs_to :user #9章
  has_many :post_comments, dependent: :destroy #18章で追記(PostCommentモデルとのアソシエーション設定)
  has_many :favorites, dependent: :destroy #19章 (Favoriteモデルとの関連付け)

  # def get_image #10章
  #   if image.attached?
  #     image
  #   else
  #     'no_image.jpg'
  #   end
  # end
  def get_image #10章 IDから画像を取得したりできる！
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user) #19章(favorited_by?メソッド使用。)
    favorites.exists?(user_id: user.id)
  end

end
