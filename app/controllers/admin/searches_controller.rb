class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search_post
    # @content = params[:content]
    # @records = Post.where(is_active: 1).search_for(@content).page(params[:page]).per(6)
    @posts = Post.search_post(params[:keyword]).page(params[:page]).per(10)
  end

  def search_customer
    # @content = params[:content]
    # @records = Post.where(is_active: 1).search_for(@content).page(params[:page]).per(6)
    @customers = Customer.search_customer(params[:keyword]).page(params[:page]).per(10)
  end
end
