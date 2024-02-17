class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #9章で追記(PostImageとのアソシエーションを設定)
  has_many :post_images, dependent: :destroy
end
