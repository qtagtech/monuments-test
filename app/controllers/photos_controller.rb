class PhotosController < ApplicationController
  before_action :set_collection, only: [:create]
  before_action :set_category, only: [:create]
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    @collections = current_user.collections
    @categories = current_user.categories

  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    @monument = Monument.new
    @monument.name = params[:monument_name]
    @monument.save
    @photo.monument = @monument
    @photo.collection = @collection

      if @photo.save
         @category.photos << @photo
         flash[:success] = "Photo saved!"
         redirect_to photos_path
       else
         render 'new'
       end


  end

  private

  def photo_params
    params.require(:photo).permit(:image, :title,:collection,:category)
  end

  def set_collection
    @collection = Collection.find(params[:collection])
  end

  def set_category
    @category = Category.find(params[:category])
  end
end
