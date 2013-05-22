module HomeHelper
	def find_tutorial_by_id(id)
		@tutorial = Tutorial.find(id)
		return @tutorial
	end
end
