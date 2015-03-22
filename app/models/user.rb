class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_and_belongs_to_many :roles
  has_many :collections
  has_many :categories
  has_many :photos


  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end