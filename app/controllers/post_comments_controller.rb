class PostCommentsController < ApplicationController
  def create #18章コメントの追加
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end
  
  def destroy #18章 コメント削除機能
    PostComment.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private #18章 投稿データのストロングパラメータ

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
