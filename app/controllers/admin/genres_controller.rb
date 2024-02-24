class Admin::GenresController < ApplicationController
   before_action :authenticate_admin!
  def index


   @genre = Genre.new
   @genres = Genre.all

  end

  def edit

   @genre = Genre.find(params[:id])

  end

  def update

   @genre = Genre.find(params[:id])

   if @genre.update(update_params)

     redirect_to admin_genres_path

   else

   @errors =  @genre.errors.full_messages

   render :edit

   end

  end

  def create

   @genre = Genre.new(update_params)

   if @genre.save

    redirect_to admin_genres_path

   else

    @genres = Genre.all

    @errors =  @genre.errors.full_messages

    render :index

   end

  end

  private

   def genre_params
    params.permit(:name)
   end

   def update_params

    params.require(:genre).permit(:name)

   end

end
