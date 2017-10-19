require "rails_helper"

describe "user creates new tag" do
  it "creates new tag" do
    visit new_tag_path

    fill_in "tag[title]", with: "Web"
    click_button "Create"

    expect(current_path).to eq("/tags/#{Tag.last.id}")
    expect(page).to have_content("Web")
    expect(Tag.count).to eq(1)
  end
end
