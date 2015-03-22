class Photo < ActiveRecord::Base
  dragonfly_accessor :image
  belongs_to :user
  belongs_to :monument
  belongs_to :collection
  validates :title, presence: true, length: {minimum: 2, maximum: 20}
  validates :image, presence: true

  validates :image, presence: true
  validates_size_of :image, maximum: 500000.kilobytes,
                    message: "should be no more than 500000 KB", if: :image_changed?

  validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false,
                     message: "should be either .jpeg, .jpg, .png, .bmp", if: :image_changed?
end
