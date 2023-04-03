class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
       byebug
    if @user.save
      session[:user_id] = @user.id
      render json: { message: "User was successfully created." }
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  
def show
  @user = User.find_by(id: session[:user_id])
  render json: {
    id: @user.id,
    name: @user.name
  }
end


  def destroy
    session.delete(:user_id)
    render json: { message: "Logged out successfully" }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
end
