class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]
  before_action :set_user_listing, only: %i[ edit update destroy ]
  before_action :authenticate_user!

  # GET /listings or /listings.json
  def index
    
   # CHANGE THIS TO SHOP AND MAKE INDEX ALL AGAIN
   @listings = Listing.where(user_id: "#{User.find_by_username(params[:username]).id}")

    # shows listings of the currently signed in user
    # @listings = Listing.where(user_id: "#{current_user.id}")
    
    # shows all listings
    # @listings = Listing.all
  end

  def shop


    # finds the listing by the username
    @listings = Listing.where(user_id: "#{User.find_by_username(params[:username]).id}")

    # @listings = Listing.where(user_id: "#{params[:username]}")
  end


  # GET /listings/1 or /listings/1.json
  def show
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
