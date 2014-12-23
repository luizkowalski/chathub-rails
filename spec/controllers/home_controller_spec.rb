require 'rails_helper'

describe HomeController do

  describe "GET #index" do
    context "when user is logged" do
      before(:each) do
        create_and_authenticate_user
      end

      it "should redirect to rooms_path" do
        get :index
        expect(response).to redirect_to rooms_path
      end
    end
  end

end
