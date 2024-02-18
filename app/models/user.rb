class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #9章で追記(PostImageとのアソシエーションを設定)
  has_many :post_images, dependent: :destroy

  has_one_attached :profile_image #14章で追加(7章同様、ActiveStorageを使い画像をアップロードできるようにします。)

  def get_profile_image(width, height) #メソッドに対して引数を設定し、引数に設定した値に画像のサイズを変換するようにしました。
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
