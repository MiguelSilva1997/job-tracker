require 'rails_helper'

describe "User sees all tags" do
  scenario "a user sees all the tags" do
    tag = Tag.create!(title: "ESPN")
    tag_two = Tag.create!(title: "Disney")

    visit tags_path

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Disney")
  end

end
