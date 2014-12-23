require 'rails_helper'

describe ApplicationHelper do
  include ApplicationHelper

  context "when validating human_date" do
    it "should return the date formatted" do
      expected = DateTime.now.strftime("%m %b %Y")
      expect(human_date(DateTime.now)).to be_eql expected
    end
  end

  context "when validating flash_class" do
    it "should return the alert-info when notice" do
      expect(flash_class('notice')).to be_eql "alert alert-info"
    end

    it "should return the alert-info when notice" do
      expect(flash_class('success')).to be_eql "alert alert-success"
    end

    it "should return the alert-info when notice" do
      expect(flash_class('error')).to be_eql "alert alert-danger"
    end

    it "should return the alert-info when notice" do
      expect(flash_class('alert')).to be_eql "alert alert-warning"
    end
  end
end