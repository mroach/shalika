require 'rails_helper'
require 'support/auth_helper'

RSpec.describe Admin::HomeController, :type => :controller do
  include AuthHelper

  describe "GET #index without credentials" do

    it "responds with forbidden" do
      get :index
      expect(response).to have_http_status(:unauthorized)
    end

  end

  describe "GET #index with valid credentials" do

    it "responds with success" do
      http_login 'linksys', 'default'
      get :index
      expect(response).to have_http_status(:success)
    end

  end

  describe "GET #index with bad credentials" do

    it "responds with forbidden" do
      http_login 'linksys', 'nope'
      get :index
      expect(response).to have_http_status(:unauthorized)
    end

  end

end
