class UsersController < ApplicationController
  before_action :current_user, except: [:new, :create]
  before_action :find_user, only: [:show, :update, :destroy, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :root
    else
      render new_user_path, flash: { error: 'Account was created successfully.' }
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit!
  end
end