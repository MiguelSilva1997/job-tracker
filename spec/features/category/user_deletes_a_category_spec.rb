require "rails_helper"

  describe "user deletes a category" do
    it "deletes a category" do
      category = Category.create(title: "Web")
      visit categories_path

      click_link "Delete"

      expect(page).to have_content("You have succesfully deleted this category")
    end

  end
