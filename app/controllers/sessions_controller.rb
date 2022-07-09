class SessionsController < ApplicationController

  # トップページ兼ログインページ
  def new
    @users = User.order(:name)
  end

  def create
    @users = User.order(:name)
    @user = User.find(params[:session][:id]) unless params[:session][:id].blank?
    if @user && @user.authenticate(params[:session][:password])

    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end
  
end
