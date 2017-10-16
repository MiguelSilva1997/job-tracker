class DashboardController < ApplicationController
  def index
    @count_of_jobs_by_interest = Job.count_of_jobs_by_interest
    @top_3_companies = Company.top_3_companies
    @jobs_by_location = Job.count_by_city
  end
end
