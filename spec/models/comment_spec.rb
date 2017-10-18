require "rails_helper"

describe Comment do
  describe "Validations" do
    it "is invalid without content" do
      comment = Comment.new()

      expect(comment).to be_invalid
    end

    it "is valid with content" do
      category = Category.create!(title: "Sports")
      company = Company.create(name: "Turing")
      job = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
      comment = Comment.new(content: "good", job_id: job.id)

      expect(comment).to be_valid
    end
  end

  describe "relationships" do
    it "responds to job" do
      category = Category.create!(title: "Sports")
      company = Company.new(name: "Turing")
      job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
      comment = Comment.new(content: "good", job_id: job.id)

      expect(comment).to respond_to(:job)
    end
  end

end
