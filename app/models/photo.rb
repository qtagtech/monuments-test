class Photo < ActiveRecord::Base
  dragonfly_accessor :image
  belongs_to :user
  belongs_to :monument
  belongs_to :collection

end
