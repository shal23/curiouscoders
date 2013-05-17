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
	{ :name => 'user' }
], :without_protection => true)
puts 'DEFAULT USERS'
user = User.create! :name => 'Administrator', 
:email => 'admin@example.com', 
:password => 'password', 
:password_confirmation => 'password'
puts 'user: ' << user.name
#user.confirm!
user.add_role :admin

puts 'Baron (Temp)'
user = User.create! :name => 'BARON', 
:email => 'dreamspacebb@gmail.com', 
:password => 'password', 
:password_confirmation => 'password'
puts 'user: ' << user.name
#user.confirm!
user.add_role :admin

puts 'TUTORIALS'
tutorial = Tutorial.create! :title => 'Getting Started with Rails',
	:about => '<p>This guide covers getting up and 
		running with Ruby on Rails. After reading it, you should be familiar 
		with:
		<ul>
			<li>Installing Rails, creating a new Rails application, and 
			connecting your application to a database</li>
			<li>The general layout of a Rails application</li>
			<li>The basic principles of MVC (Model, View Controller) and RESTful design</li>
			<li>How to quickly generate the starting pieces of a Rails application</li>
		</ul>',
	:url => 'http://guides.rubyonrails.org/getting_started.html'
puts 'tutorial: ' << tutorial.title