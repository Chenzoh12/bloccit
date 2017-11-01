class AdvertisementsController < ApplicationController
  def index
    @ads = Advertisement.all
  end

  def show
    @ads = Advertisement.find(params[:id])
  end

  def new
    @ads = Advertisement.new
  end

  def create
    @ads = Advertisement.new
    @ads.title = params[:advertisement][:title]
    @ads.copy = params[:advertisement][:copy]
    @ads.price = params[:advertisement][:price]

    # #10
    if @ads.save
      flash[:notice] = "Ad was saved."
      redirect_to @ads
    else
      flash.now[:alert] = "There was an error saving the ad. Please try again."
      render :new
    end
  end
end
