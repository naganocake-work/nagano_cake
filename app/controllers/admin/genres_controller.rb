class Admin::GenresController < ApplicationController
   before_action :authenticate_admin!
  def index



  end

  def edit
  end

  def create

   @genre = Genre.new(genre_params)

   @genre.save

   redirect_to admin_genres_path

  end
  private
   def genre_params

    params.permit(:name)

   end

end
