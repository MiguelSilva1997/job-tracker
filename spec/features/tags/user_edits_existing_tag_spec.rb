require "rails_helper"

describe "when user clicks edit" do
  it "edits the current tag" do
    tag = Tag.create!(title: "Sports")
    visit edit_tag_path(tag)

    fill_in "tag[title]", with: "EA Sports"
    click_button "Update"

    expect(current_path).to eq("/tags/#{tag.id}")
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content("gol")
  end

end
