class Public::PostCommentsController < ApplicationController
  before_action :authenticate_customer!, only: :create

  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_customer.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    if @post_comment.save
      flash.now[:notice] = "コメントを投稿しました"
      render :post_comments
    else
      render 'posts/show'
    end
  end

  def destroy
    # @post = Post.find(params[:post_id])
    # post_comment = @post.post_comments.find(params[:id])
    # post_comment.destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    flash.now[:alert] = '投稿を削除しました'
    @post = Post.find(params[:post_id])
    render :post_comments
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
