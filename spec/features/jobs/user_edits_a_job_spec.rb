require 'rails_helper'

describe "User edits a job" do
  scenario "a user can edit a job" do
    category = Category.create!(title: "Sport")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", description: "Good", level_of_interest: 70, city: "Denver", category_id: category.id)
    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Colorado"

    click_button "Update"

    expect(current_path).to eq("/jobs/#{job.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Colorado")
  end
end
