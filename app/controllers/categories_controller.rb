class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    respond_to do |format|
      if @category.save
        current_user.categories << @category
        format.html { redirect_to @category, notice: 'Category added to your personal list.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def update
    respond_to do |format|
      if @category.user.id == current_user.id
        if @category.update(category_params)
          format.html { redirect_to @category, notice: 'category was successfully updated.' }
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
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
