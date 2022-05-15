class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.build(post_comment_params)
    @post_comment.customer_id = current_customer.id
    if @post_comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to request.referer
    else
      @comments = @item.comments.page(params[:page]).per(3)
      render "index"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    post_comment = @post.post_comments.find(params[:id])
    post_comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
