class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search_post
    @posts = Post.search_post(params[:keyword]).page(params[:page]).per(9).order(created_at: :desc)
  end

  def search_customer
    @customers = Customer.search_customer(params[:keyword]).where(is_deleted: false).page(params[:page]).per(9)
  end
end
