class HomeController < ApplicationController
  def index
    @users = User.all
    @tutorials = Tutorial.all
    @teams = Team.all
  end
end
