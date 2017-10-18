require "rails_helper"

describe "when user clicks edit" do
  it "edits the current category" do
    category = Category.create!(title: "Sports")
    visit edit_category_path(category)

    fill_in "category[title]", with: "EA Sports"
    click_button "Update"

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content("gol")
  end

end
