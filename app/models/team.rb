class Team < ActiveRecord::Base
	has_many :memberships
	has_many :conversations
	has_many :users, :through => :memberships

	has_many :posts, :as => :postable, :dependent => :destroy

	attr_accessible :about, :location, :name, :user_ids, :creator

	def in_team?(user)
	  self.users.include?(user)
	end
end