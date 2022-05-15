class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def search_post
    # @content = params[:content]
    # @records = Post.where(is_active: 1).search_for(@content).page(params[:page]).per(6)
    @posts = Post.search_post(params[:keyword])
  end

  def search_customer
    # @content = params[:content]
    # @records = Post.where(is_active: 1).search_for(@content).page(params[:page]).per(6)
    @customer = Customer.search_customer(params[:keyword])
  end
end