require 'rails_helper'

describe "User sees one tag" do
  scenario "a user sees a tag" do
    tag = Tag.create!(title: "Sports")

    visit tag_path(tag)

    expect(current_path).to eq("/tags/#{tag.id}")
    expect(page).to have_content("Sports")
  end
end
