class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy favourite]
  before_action :set_user_listing, only: %i[ edit update destroy ]
  before_action :authenticate_user!

  # GET /listings or /listings.json
  def index
  # this shows all of the users listing in their shop
   @listings = Listing.where(user_id: "#{User.find_by_username(params[:username]).id}")

  end

  def shop
    # finds the listing by the username
    @listings = Listing.where(user_id: "#{User.find_by_username(params[:username]).id}")
  end

  def favourite
      # Add and remove favorite recipes
      # for current_user
    type = params[:type]
    if type == "favourite"
      current_user.favourites << @listing 
      # redirect_to faves_path(current_user.username), notice: "Listing was successfully faved."
      flash.now[:notice] = "Listing was successfully faved."
      

    elsif type == "unfavourite"
      current_user.favourites.delete(@listing) 
      redirect_to faves_path(current_user.username), notice: "Listing was successfully unfaved."
      

    else
      # Type missing, nothing happens
      redirect_back fallback_location: @listing, notice: 'Nothing happened.'
    end
  end

    def fave_list
      @listings = current_user.favourites
    end
  
  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end

   # GET /listings/1 or /listings/1.json
  def show
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        client_reference_id: current_user ? current_user.id : nil,
        customer_email: current_user ? current_user.email : nil,
        line_items: [{
            name: @listing.name,
            description: @listing.description,
            images: ["#{@listing.picture.url}"],
            amount: (@listing.price * 100).to_i,
            currency: 'aud',
            adjustable_quantity: {
              enabled: true,
              minimum: 1,
              maximum: 50,
            },
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                listing_id: @listing.id,
                user_id: current_user.id,
            }
        },
        mode: 'payment',
        success_url: "#{root_url}payments/success?listingId=#{@listing.id}",
        cancel_url: "#{root_url}"
      )
      @session_id = session.id
  end



  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    respond_to do |format|
      if @listing.save
        format.html { redirect_to shop_index_path(current_user.username), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to shop_index_path(current_user.username), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to shop_index_path(current_user.username), notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_user_listing
      @listing = current_user.listings.find_by_id(params[:id])
      if @listing == nil
        flash[:alert] = "You don't have permission to do that"
          redirect_to listings_path
        end
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:name, :description, :price, :size, :finish, :user_id, :picture)
    end
end
