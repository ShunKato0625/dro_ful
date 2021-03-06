class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.page(params[:page]).per(6)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "#{@customer.nick_name}さんの会員情報を更新しました"
      redirect_to admin_customer_path(@customer.id)
    else
      render "edit"
    end
  end

  private

    def customer_params
      params.require(:customer).permit(:nick_name, :email, :is_deleted, :introduction, :profile_image)
    end
end
