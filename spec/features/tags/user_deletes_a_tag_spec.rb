require "rails_helper"

  describe "user deletes a tag" do
    it "deletes a tag" do
      tag = Tag.create(title: "Web")
      visit tags_path

      click_link "Delete"

      expect(page).to have_content("You deleted #{tag.title}")
    end

  end
