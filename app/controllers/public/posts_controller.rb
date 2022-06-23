class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, except: [:show, :index]
  before_action :correct_post, only: [:edit, :update, :destroy]
  impressionist :actions => [:show]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      flash[:notice] =  "投稿しました"
      redirect_to post_path(@post.id)
    else
      render "new"
    end
  end

  def index
    @posts = Post.all.page(params[:page]).per(9).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.order(created_at: :desc)
    impressionist(@post, nil, unique: [:session_hash])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.customer_id = current_customer.id
    if @post.update(post_params)
      flash[:notice] = "投稿内容を更新しました"
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
    flash[:notice] = "投稿を削除しました"
  end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :shooting_date, :access,
                                 :drone_type, :authorization,
                                 :remarks, :rate, :image, :prefecture_id,
                                 :lat, :lng, request:[]
                                )
  end

  def correct_post # []にはURLを打ったらユーザー詳細に返す
    @post = Post.find(params[:id])
    unless @post.customer.id == current_customer.id
      redirect_to post_path, alert: 'このページへは遷移できません。'
    end
  end

end
