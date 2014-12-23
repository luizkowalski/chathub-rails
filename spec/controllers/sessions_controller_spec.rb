require 'rails_helper'

describe SessionsController do

  describe "GET #new" do
    context "when loggin in" do
      it "should redirect to the correct url" do
        get :new
        expect(response).to redirect_to '/auth/github'
      end
    end
  end

  describe "GET #destroy" do
    context "when loggin out" do

      it "should redirect to the correct url" do
        get :destroy
        expect(response).to redirect_to root_path
      end

      it "uid in session should be nil" do
        get :destroy
        expect(session[:uid]).to be_nil
      end
    end
  end

end
