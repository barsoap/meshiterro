class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save #21章 バリデーション設定
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page]) #22章 ページネーション
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy #13章で追記
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end

  #投稿データのストロングパラメータ
  private
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
