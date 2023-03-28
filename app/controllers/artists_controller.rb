class ArtistsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index 
        artists = Artist.all 
        render json: artists, status: :ok 
    end 


    def show 
        artist = Artist.find(params[:id])
        render json: artist, status: :ok 
    end 

    def create
        artist = Artist.new(artist_params)
    
        if artist.save
          render json: artist, status: :created
        else
          render json: { error: "Failed to create artist" }, status: :unprocessable_entity
        end
    end

    def update
        artist = Artist.find(params[:id])
    
        if artist.update(artist_params)
          render json: artist, status: :ok
        else
          render json: { error: "Failed to update artist" }, status: :unprocessable_entity
        end
      end
    
    

    private 
   def render_not_found
    render json: {errors:"Artist not found"}, status: :unprocessable_entity
   end 

   def artist_params
    params.require(:artist).permit(:name, :bio, :category_id, :email, :password)
  end
end
