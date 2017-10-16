class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts, dependent: :destroy

  def self.average_level_of_interest
    joins(:jobs)
    .group(:name)
    .average(:level_of_interest)
  end

  def self.top_3_companies
    average_level_of_interest.sort_by{|company, average| average}.reverse.first(3)
  end
end
