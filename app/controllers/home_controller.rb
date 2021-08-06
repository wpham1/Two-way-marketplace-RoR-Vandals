class HomeController < ApplicationController
  before_action :set_listing, only: %i[ show ]
  
  def page
    @listings = Listing.all
  end
 
end
