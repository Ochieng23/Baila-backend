class SessionsController < ApplicationController
  def create
    user = Listener.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      session[:session_id] = request.session_options[:id]
      render json: { success: true, message: "Logged in successfully." }
    else
      render json: { success: false, errors: ["Invalid email or password."] }, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete(:session_id)
    head :no_content
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
  
end
