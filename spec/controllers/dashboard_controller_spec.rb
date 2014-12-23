require 'rails_helper'

describe DashboardController do

  before(:each) do
    create_and_authenticate_user
  end

  describe "GET #index" do
    context "when user is not admin" do
      it "should redirect to root path" do
        get :index
        expect(response).to redirect_to root_path
      end
    end

    context "when user is admin" do
      before(:each) do
        create(:admin, uid: @user.uid)
      end

      it "should assign the facade" do
        get :index
        expect(assigns(:admin_facade)).not_to be_nil
      end
    end
  end
end
