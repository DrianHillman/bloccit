require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
  let (:my_ad) do
    Advertisement.create(
    title: RandomData.random_sentence,
    copy: RandomData.random_paragraph,
    price: 0)
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_ad] to @ads" do
      get :index
      expect(assigns(:ads)).to eq([my_ad])
    end
  end

end
  # describe "GET show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET create" do
  #   it "returns http success" do
  #     get :create
  #     expect(response).to have_http_status(:success)
  #   end
  # end
