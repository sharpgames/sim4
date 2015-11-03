require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
    # userをFactoryGirlで作る
	  let(:user) { FactoryGirl.build(:user) }
	#     　　# 作ったユーザでログインする
	  before do
			user.save
	    login_user user
    end

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #history" do
    it "returns http success" do
      get :history
      expect(response).to have_http_status(:success)
    end
  end

end
