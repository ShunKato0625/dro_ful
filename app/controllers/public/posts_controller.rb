class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
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
    @customer = Customer.find(current_customer.id)
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @post_comment = PostComment.new
    impressionist(@post, nil, unique: [:session_hash])
  end

  def update
    @post = Post.find(params[:id])
    @post.customer_id = current_customer.id
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿内容を更新しました'
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :shooting_date, :access,
                                 :drone_type, :authorization,
                                 :remarks, :rate, :image, :prefecture_id,
                                  request:[]
                                )
  end
end
