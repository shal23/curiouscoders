class HomeController < ApplicationController
  def index
    @users = User.all
    @teams = Team.all
    @tutorials = Tutorial.all
    #@tutorial = Tutorial.search(params[:search])
  end
end

	def get_topic_results
    	@found_results = []
    	@topics.each do |topic|
      #if tutorial.tags.find_by_name(params[:search])
       # @found_results << tutorial
      end         
    end