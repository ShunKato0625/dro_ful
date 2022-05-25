class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all.page(params[:page]).per(9).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿内容を更新しました"
      redirect_to admin_post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
    flash[:notice] = "投稿を削除しました"
  end


  private

    def post_params
      params.require(:post).permit(:title, :shooting_date, :access,
                                   :drone_type, :authorization,  :customer_id,
                                   :remarks, :rate, :image, :prefecture_id,
                                   request:[]
                                  )
    end

end
