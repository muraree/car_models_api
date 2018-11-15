require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do
  describe "get_all_makes" do
    it "Get All Makes" do
      get :get_all_makes, :format => :json
      expect(JSON.parse(response.body)["Message"]).to eq('Response returned successfully')
    end
  end

  describe "get_models_for_make_id" do
    it "Get Models for MakeId" do
      get :get_models_for_make_id, params: { make_id: 440 }, :format => :json
      expect(JSON.parse(response.body)["Message"]).to eq('Response returned successfully')
      expect(JSON.parse(response.body)["SearchCriteria"]).to eq('Make:440')
    end
  end

  describe "get_models_for_make_id_year" do

    it "Get Models for Make Id and a combination of Year" do
      get :get_models_for_make_id_year, params: { make_id: 474, make_year: 2015 }, :format => :json
      res = JSON.parse(response.body)
      expect(JSON.parse(response.body)["Message"]).to eq('Results returned successfully')
      expect(JSON.parse(response.body)["SearchCriteria"]).to eq('Make ID:474 | ModelYear:2015')
    end

  end

end
