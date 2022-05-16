class Public::PostCommentsController < ApplicationController
  before_action :authenticate_customer!, only: :create

  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_customer.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    flash.now[:notice] = "コメントを投稿しました"
    render :validater unless @post_comment.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.find(params[:id])
    @post_comment.destroy
    # PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    flash[:alert] = '投稿を削除しました'
    # @post = Post.find(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
