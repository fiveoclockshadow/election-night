class Candidate < ActiveRecord::Base
  has_many :enrollments, dependent: :restrict_with_error
  has_many :campaigns, through: :enrollments

  def number_of_won_campaigns
    campaigns.won(id).count
  end
end
