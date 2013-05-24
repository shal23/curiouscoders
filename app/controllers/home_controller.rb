class HomeController < ApplicationController
  def index
    @users = User.all
    @teams = Team.all
    @tutorials = Tutorial.all
  end
end