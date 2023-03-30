class AlbumsController < ApplicationController

    def index 
        albums = Album.all.includes(:songs)
        render json: albums, include: :songs, status: :ok 
      end 
      
      def show 
        album = Album.find(params[:id])
        render json: album, include: :songs, status: :ok
      end 
      
      

    def update
        album = Album.find(params[:id])
        if album.update(album_params)
          render json: album, status: :ok
        else
          render json: { error: album.errors.full_messages.join(', ') }, status: :unprocessable_entity
        end
      end

      def update
        album = Album.find(params[:id])
        if album.update(album_params)
          render json: album, status: :ok
        else
          render json: { errors: album.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      # Delete an album
      def destroy
        album = Album.find(params[:id])
        album.destroy
        head :no_content
      end

      private 

      def album_params
        params.require(:album).permit(:name, :release_date, :category_id)
      end
    
    
end
