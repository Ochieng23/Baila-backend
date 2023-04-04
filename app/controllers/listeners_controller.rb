class ListenersController < ApplicationController
  before_action :set_listener, only: %i[  update destroy ]

  # GET /listeners
  def index
    @listeners = Listener.all

    render json: @listeners
  end

  # POST /listeners
  def create
    @listener = Listener.new(user_params)
         
    if @listener.save
      session[:user_id] = @listener.id
      render json: { message: "User was successfully created." }
    else
      render json: { error: @listener.errors.full_messages }, status: :unprocessable_entity
    end
  end
    
  def show
    @listener = Listener.find_by(id: session[:user_id])
    if @listener
      render json: {
        id: @listener.id,
        name: @listener.username
      }
    else
      render json: { error: "Listener not found" }, status: :not_found
    end
  end
  

  # PATCH/PUT /listeners/1
  def update
    if @listener.update(listener_params)
      render json: @listener
    else
      render json: @listener.errors, status: :unprocessable_entity
    end
  end

  # DELETE /listeners/1
  def destroy
    @listener.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listener
      @listener = Listener.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :email, :password)
    end
end
