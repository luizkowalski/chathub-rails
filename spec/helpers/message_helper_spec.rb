require 'rails_helper'

describe MessageHelper do
  include MessageHelper

  context "when validating message_count_formatter" do
    it "should return the correct value when number is 1_000_000_000" do
      expect(message_count_formatter(1_000_000_000)).to be_eql "1G"
    end

    it "should return the correct value when number is 1_000_000" do
      expect(message_count_formatter(1_000_000)).to be_eql "1Mi"
    end

    it "should return the correct value when number is 1_000" do
      expect(message_count_formatter(1_000)).to be_eql "1K"
    end

    it "should return the correct value when number is 200" do
      expect(message_count_formatter(200)).to be_eql "200"
    end
  end

end