require 'rails_helper'

describe Tagging do
  describe "relationships" do
    it "taggings respond to tag" do
      tagging = Tagging.new
      expect(tagging).to respond_to(:tag)
    end

    it "taggings respond to job" do
      tagging = Tagging.new
      expect(tagging).to respond_to(:job)
    end
  end
end
