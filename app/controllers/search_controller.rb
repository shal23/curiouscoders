class SearchController < ApplicationController

  def index
  	@tutorials = Tutorial.all
  	if params[:search].present?
  		get_search_results
  	end
  end

  private 

  def get_search_results
    @found_results = []
    @tutorials.each do |tutorial|
      if tutorial.tags.find_by_name(params[:search])
        @found_results << tutorial
      end         
    end

    if @found_results 
      #@search_location = Venue.create(:address => params[:search])
      #@venues = Venue.near(params[:search], params[:radius], :order => :distance)
      #@json = Tutorial.near(params[:search], params[:radius], :order => :distance).to_gmaps4rails
    else
      @venues = Tutorial.all
      @json = Tutorial.all.to_gmaps4rails
    end
  end
end
