class HomeController < ApplicationController
  def index
    @users = User.all
    @teams = Team.all
    @tutorials = Tutorial.all
    #@tutorial = Tutorial.search(params[:search])
  end
end