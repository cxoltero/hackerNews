class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user, status: :created, location: @user
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    render json: @user, status: :created, location: @user
  end


  private

  def user_params
     params.require(:user).permit(:name, :about, :email)
  end

end
