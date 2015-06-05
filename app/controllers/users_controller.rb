class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(action: 'index')
    else
      render('new')
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to controller: :users, action: :index
        flash[:notice] = 'Användaren raderades'
    end

  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

end
