class MainController < ApplicationController
 
  def index
    @photos = current_user.photos
  end

  def publish
  end
end
