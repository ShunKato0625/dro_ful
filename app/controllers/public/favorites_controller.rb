class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @post = Post.find(params[:post_id])
    @favorite = current_customer.favorites.new(post_id: @post.id)
    @favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = @post.favorites.find_by(customer_id: current_customer.id)
    @favorite.destroy
  end

  private

  def post_params
    @post = Post.find(params[:post_id])
  end

end
