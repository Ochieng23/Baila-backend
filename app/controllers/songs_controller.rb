class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :destroy]

  def index
    @songs = Song.with_attached_audio.all

    render json: @songs.map { |song|
      {
        id: song.id,
        name: song.name,
        length: song.length,
        album_id: song.album_id,
        image_url: song.image_url,
        audio_url: song.audio.attached? ? url_for(song.audio) : nil
      }
    }
  end

  def show
    render json: {
      id: @song.id,
      name: @song.name,
      length: @song.length,
      album_id: @song.album_id,
      image_url: @song.image_url,
      audio_url: @song.audio.attached? ? url_for(@song.audio) : nil
    }, status: :ok
  end
  

  def latest
    latest_song = Song.last

    if latest_song
      render json: song_attributes(latest_song)
    else
      render json: { error: "No songs found" }, status: :not_found
    end
  end

  def create
    song = Song.new(song_params)

    if song.save
      song.audio.attach(params[:audio]) if params[:audio].present?

      render json: {
        song: song,
        image_url: song.image.attached? ? url_for(song.image) : nil,
        audio_url: song.audio.attached? ? url_for(song.audio) : nil
      }, status: :created, location: song
    else
      render json: song.errors, status: :unprocessable_entity
    end
  end

  def update
    if @song.update(song_params)
      render json: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @song.destroy
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.permit(:name, :length, :album_id, :image, :audio)
  end

  def song_attributes(song)
    {
      id: song.id,
      name: song.name,
      length: song.length,
      album_id: song.album_id,
      image_url: song.image_url,
      audio_url: song.audio.attached? ? url_for(song.audio) : nil
    }
  end
end
