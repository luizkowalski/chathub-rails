require 'rails_helper'

describe User do
  context "when validating" do
    before(:each) do
      @user = create(:user)
    end

    it { expect(@user).to be_valid }
    it { expect(@user).to validate_presence_of(:uid) }
    it { expect(@user).to validate_presence_of(:nickname) }
  end

  context "when creating a new user from hash" do
    it "should return an user with the same UID" do
      user = User.find_or_create_from_auth_hash(get_hash)
      expect(user.uid).to be_eql '123456'
    end
  end

  context "when updating an user's last login date" do
    it "last login date should no be nil" do
      user = create(:user)
      expect(user.last_login_at).to be_nil
      user.update_last_login
      user.reload
      expect(user.last_login_at).not_to be_nil
    end
  end

  def get_hash
    auth_hash = Hash.new
    auth_hash['uid'] = '123456'
    auth_hash['provider'] = 'github'

    auth_hash['info'] = Hash.new
    auth_hash['extra'] = Hash.new
    auth_hash['extra']['raw_info'] = Hash.new

    auth_hash
  end
end
