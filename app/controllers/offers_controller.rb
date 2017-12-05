class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  # GET /offers
  # GET /offers.json
  def index
    @teste = [
        {"name":"Beyoncé Lemonade CD Pop",
         "image":"https://upload.wikimedia.org/wikipedia/en/5/53/Beyonce_-_Lemonade_%28Official_Album_Cover%29.png"},

        {"name":"Caneca Cogumelo (Toad) Mario Bros",
         "image":"http://s3.amazonaws.com/img.iluria.com/product/4ABFD3/B4E0B6/450xN.jpg"},

        {"name":"Printed Fit & Flare Skirt, Created for Macy's",
         "image":"https://slimages.macysassets.com/is/image/MCY/products/0/optimized/8817680_fpx.tif?op_sharpen=1&wid=400&hei=489&fit=fit,1&$filterlrg$"},

        {"name":"Cachepot Echoes em Madeira Maciça 9,9 x 40 x 60 cm Jatobá - Mão e Formão",
         "image":"https://static.carrefourdigital.com.br/medias/sys_master/images/images/hc4/h2b/h00/h00/9271335125022.jpg"},

        {"name":"Kiara Embellished Peep-Toe Evening Pumps",
         "image":"https://slimages.macysassets.com/is/image/MCY/products/7/optimized/2112357_fpx.tif??op_sharpen=1&fit=fit,1&$filterlrg$&wid=1200&hei=1467"},

        {"name":"Wrist Waterproof Bluetooth Smart Watch Phone Mate For Android Samsung iPhone iOS",
         "image":"https://sc01.alicdn.com/kf/HTB1ZILxLpXXXXcLXXXXq6xXFXXXC/Wholesale-Smart-Bluetooth-Watch-M26-Wrist-Watch.jpg"}
    ].shuffle!

    if current_user.admin?
      @offers = Offer.all
    else
      @offers = Offer.where(:offer_state => :enabled)
      render :index_users
    end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
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

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
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

  # DELETE /offers/1
  # DELETE /offers/1.json
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
