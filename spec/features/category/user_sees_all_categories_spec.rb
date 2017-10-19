require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category = Category.create!(title: "ESPN")
    category_two = Category.create!(title: "Disney")

    visit categories_path

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Disney")
  end

end
