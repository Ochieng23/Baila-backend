class SongsController < ApplicationController
  before_action :set_song, only: %i[ show update destroy ]

  # GET /songs
  def index
    @songs = Song.all

    render json: @songs
  end

  # GET /songs/1
  def show
    render json: @song
  end

  def latest
    # Find the latest song in the database
    latest_song = Song.last
  
    # Check if there is a latest song
    if latest_song.nil?
      # If there is no latest song, return an error with 404 status code
      render json: { error: "No songs found" }, status: :not_found
    else
      # If there is a latest song, serialize its attributes and return them as JSON
      song_json = SongSerializer.new(latest_song).serializable_hash
      render json: song_json[:data][:attributes]
    end
  end
  


  # POST /songs
  def create
    @song = Song.new(song_params)
    
    if @song.save
      render json: @song, status: :created, location: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end
  

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      render json: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    private

    def song_params
      params.permit(:name, :length, :album_id, :image).tap do |whitelisted|
        whitelisted[:image] = params[:image] if params[:image].present?
      end
    end 
    
    
end
