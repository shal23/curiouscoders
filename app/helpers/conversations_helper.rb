module ConversationsHelper
	def user_teams(user)
		user.teams.map(&:name)
	end
end
