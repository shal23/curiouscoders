class Team < ActiveRecord::Base
	has_many :memberships
	has_many :users, :through => :memberships

	attr_accessible :about, :location, :name, :user_ids
end
