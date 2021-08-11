class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :authenticate_user!
    before_action :initialise_session
    before_action :load_cart  



    
private
def initialise_session
  session[:cart] ||= [] # Initialises a cart on session
end

def load_cart
  @cart = Listing.find(session[:cart])
end
 
        protected
      
        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
        end
      

end
