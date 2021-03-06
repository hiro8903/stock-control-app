class SessionsController < ApplicationController

  # トップページ兼ログインページ
  def new
    @users = User.order(:name)
  end

  def create
    @users = User.order(:name)
    @user = User.find(params[:session][:id]) unless params[:session][:id].blank?
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
end
