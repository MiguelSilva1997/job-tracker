require "rails_helper"

describe "user creates new category" do
  it "creates new category" do
    visit new_category_path

    fill_in "category[title]", with: "Web"
    click_button "Create"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Web")
    expect(Category.count).to eq(1)
  end
end
