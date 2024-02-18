class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images #@user.post_imagesの場合は、ユーザーが投稿した投稿画像を全て取得します。
                                     # したがって、データが投稿画像の数だけ、複数存在するという形になります。
  end

  def edit #16章 ユーザー情報の編集
    @user = User.find(params[:id])
  end

  def update #16章 更新機能１
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private #16章 更新機能２(ストロングパラメータで登録できるデータを設定)

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
