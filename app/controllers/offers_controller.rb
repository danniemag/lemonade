class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.admin?
      @offers = Offer.all
    else
      @offers = Offer.where(:offer_state => :enabled)
      render :index_users
    end
  end


  def show
  end


  def new
    @offer = Offer.new
  end


  def edit
  end


  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def enabler
    Offer.find_by_id(params[:offer_id]).enable!
    redirect_to offers_path
  end


  def disabler
    Offer.find_by_id(params[:offer_id]).disable!
    redirect_to offers_path
  end


  def index_users
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def offer_params
    params.require(:offer).permit(:advertiser_name, :url, :description, :starts_at, :ends_at, :premium, :offer_state)
  end

end
