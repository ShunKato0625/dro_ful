class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search_post
    @posts = Post.search_post(params[:keyword]).page(params[:page]).per(8)
  end

  def search_customer
    @customers = Customer.search_customer(params[:keyword]).page(params[:page]).per(10)
  end
end
