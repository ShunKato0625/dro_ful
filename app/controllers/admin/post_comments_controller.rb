class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @post = Post.find(params[:post_id])
    @admin = current_admin
    @post_comment = current_admin.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    render :validater unless @post_comment.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @customer = current_customer
    @post_comment = @post.post_comments.find(params[:id])
    @post_comment.destroy
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
