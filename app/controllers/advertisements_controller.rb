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
      @ads.copy = params[:ads][:copy]
      @ads.price = params[:ads][:price]
      @ads.title = params[:ads][:title]
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
