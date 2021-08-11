class HomeController < ApplicationController
  before_action :set_listing, only: %i[ show ]
  before_action :initialise_session
  before_action :load_cart
  
  def page
    @listings = Listing.all
  end
 
private
def initialise_session
  session[:cart] ||= [] # Initialises a cart on session
end

def load_cart
  @cart = Listing.find(session[:cart])
end



end
