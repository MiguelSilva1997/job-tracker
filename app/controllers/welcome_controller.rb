class WelcomeController < ApplicationController

  def welcome
    @city = Job.select(:city).sample.city
  end
end
