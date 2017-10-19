require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
  
  let (:my_ad) do
    Advertisement.create(
      id: 1,
      title: RandomData.random_sentence,
      copy: RandomData.random_paragraph,
      price: 99
    )
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns my_ad to @ads" do
      get :show, {id: my_ad.id}
      expect(assigns(:ads)).to eq(my_ad)
    end
  end


  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the show view" do
      get :show, {id: my_ad.id}
      expect(response).to render_template :show
    end
    
    
    it "assigns my_ad to @ads" do
      get :show, {id: my_ad.id}
      expect(assigns(:ads)).to eq(my_ad)
    end
  end
  
  

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @ads" do
      get :new
      expect(assigns(:ads)).not_to be_nil
    end
    
  end
  
  describe "POST #create" do
    it "inceases number of ads by 1" do
      expect{ post :create, ads: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 10 } }.to change(Advertisement,:count).by(1)
    end
    # #5
    it "assigns the new ad to @ads" do
      post :create, ads: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 10}
      expect(assigns(:ads)).to eq Advertisement.last
    end
    
    # #6
    it "redirects to the new ad" do
      post :create, ads: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 10}
      expect(response).to redirect_to Advertisement.last
    end
  end
end
