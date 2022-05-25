class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update]

  def index
    @customers = Customer.all.where(is_deleted: false).page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.page(params[:page]).per(6)
    if @customer.id == current_customer.id
      redirect_to customer_my_page_path(@customer.id)  #自分を選択した時はマイページに遷移させる
    end
  end

  def edit
   @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.id = current_customer.id
    if current_customer.update(customer_params)
      flash[:notice] = "会員情報が更新されました"
      redirect_to customer_my_page_path(@customer.id)
    else
      @customer = current_customer
      render 'public/customers/edit'
    end
  end

  def mypage
    @customer = current_customer
    @posts = @customer.posts.page(params[:page]).per(4)
    @favorites = Favorite.where(customer_id: current_customer.id).page(params[:page]).per(4)
    return unless request.xhr?
    case params[:type]
    when 'favorite', 'post'
      render "#{params[:type]}"
    end
  end

  def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  private

  def ensure_correct_customer # []にはURLを打ったらユーザー詳細に返す
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end


  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                     :nick_name, :email, :introduction, :profile_image)
  end


end
