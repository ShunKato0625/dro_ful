class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all#.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿情報を更新しました"
      redirect_to admin_post_path(@post.id)
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_post_path(post.id), method: :delete
    flash[:notice] = "post was successfully destroyed."
  end

  def favorited_by?(admin)
    favorites.exists?(admin: admin)
  end

  private

    def post_params
      params.require(:post).permit(:title, :shooting_date, :access,
                                   :drone_type, :authorization,  :customer_id,
                                   :remarks, :rate, :image, :prefecture_id
                                  )
    end

end
