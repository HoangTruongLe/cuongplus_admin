class Super::UsersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @q = User.ransack(params[:q])
    users = @q.result().filter_and_sort(params)
    @users = users.page(params[:page]).per(20)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to super_users_path, notice: 'Success'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to super_users_path, notice: 'Success'
    else
      render :edit, notice: 'Error'
    end
  end

  def update_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to super_users_path, notice: 'Success'
    else
      render 'super/users/edit', notice: 'Error'
    end
  end

  def destroy
    @user.destroy unless @user.super_user?
    redirect_to super_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
