# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
role_admin = Role.create :name => 'ADMIN'
role_user = Role.create :name => 'USER'
user = User.create :email => 'juanda6@gmail.com', :password => '123456', :password_confirmation => "123456"
user.roles << role_admin
user.roles << role_user