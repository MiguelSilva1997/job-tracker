require 'rails_helper'

describe Category do
  describe "validations" do
    it "makes sure that content is present" do
      category = Category.new()
      expect(category).to be_invalid
    end

    it "creates a new category" do
      category = Category.new(title: "Web")
      expect(category).to be_valid
    end
  end

  describe "relationships" do
    it "responds to jobs method" do
      category = Category.new(title: "Web")
      expect(category).to respond_to (:jobs)
    end
  end
end
