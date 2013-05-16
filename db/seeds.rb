# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
Role.create([
	{ :name => 'admin' }, 
	{ :name => 'student' }, 
	{ :name => 'tutor' }
], :without_protection => true)
puts 'DEFAULT USERS'
user = User.create! :name => 'Administrator', 
:email => 'admin@example.com', 
:password => 'password', 
:password_confirmation => 'password'
puts 'user: ' << user.name
user.confirm!
user.add_role :admin
puts 'Baron (Temp)'
user = User.create! :name => 'BARON', 
:email => 'dreamspacebb@gmail.com', 
:password => 'password', 
:password_confirmation => 'password'
puts 'user: ' << user.name
user.confirm!
user.add_role :admin