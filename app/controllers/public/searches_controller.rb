class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search_post
    @customer = Customer.find(current_customer.id)
    @posts = Post.search_post(params[:keyword]).page(params[:page]).per(8)
  end

  def search_customer
    @customers = Customer.search_customer(params[:keyword]).where(is_deleted: false).page(params[:page]).per(10)
  end
end
