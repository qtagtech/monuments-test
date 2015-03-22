class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  def index
    @collections = current_user.collections
  end

  def new
    @collection = Collection.new
  end

  def edit
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user

    respond_to do |format|
      if @collection.save
        current_user.collections << @collection
        format.html { redirect_to @collection, notice: 'Collection added to your personal list.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @collection.user.id == current_user.id
        if @collection.update(collection_params)
          format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        else
          format.html { render :update }
        end
      else
        redirect_to action: "index"
      end

    end
  end

  def destroy
  end

  private
  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name, :description)
  end
end
