require "rails_helper"

describe "user sees one job" do
  scenario "user sees content" do
    category = Category.create!(title: "Sport")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", description: "Good", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit job_path(job)

    expect(current_path).to eq("/jobs/#{job.id}")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Good")
    expect(page).to have_content(70)
  end
end
