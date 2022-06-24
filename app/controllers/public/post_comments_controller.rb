class Public::PostCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @post = Post.find(params[:post_id])
    @customer = current_customer
    @post_comment = current_customer.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    render :validater unless @post_comment.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @customer = current_customer
    @post_comment = @post.post_comments.find(params[:id])
    if @post_comment.customer_id == current_customer.id
      @post_comment.destroy
    else
      redirect_to post_path(@post.id)
      flash[:alert] = "他人のコメントは削除できません"
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
