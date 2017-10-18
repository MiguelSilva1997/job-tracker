require 'rails_helper'

describe Tag do
  describe "validations" do
    it "invalid without title" do
      tag = Tag.new()
      expect(tag).to be_invalid
    end

    it "is valid with title" do
      tag = Tag.new(title: "DevOps")
      expect(tag).to be_valid
    end
  end

  describe "relationships" do
    it "has many jobs" do
      tag = Tag.new(title: "DevOps")
      expect(tag).to respond_to(:jobs)
    end
  end
end
