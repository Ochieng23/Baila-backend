class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      render json: { message: "User was successfully created." }
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def current_user
    session_id = cookies.signed[:session_id]
    puts "Session ID: #{session_id}"
    return unless session_id.present?
  
    @current_user = User.find_by_session_id(session_id)
    puts "Current User: #{@current_user}"
    
    if @current_user
      render json: @current_user.as_json(except: [:password_digest, :session_id]), status: :ok
    else
      head :no_content
    end
  end
  
  
  
  
  
  
  def show
    @user = User.find_by(id: session[:user_id])
    render json: @user
  end

  def destroy
    session.delete(:user_id)
    render json: { message: "Logged out successfully" }
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
