class Candidate < ActiveRecord::Base
  has_many :enrollments, dependent: :restrict_with_error
  has_many :campaigns, through: :enrollments

  CONSIDERING_ATTRIBUTES = %w(charisma intelligence willpower).freeze

  def number_of_won_campaigns
    campaigns.won(id).count
  end

  def skill_in_combat(skill)
    up_or_down = rand.round
    flip = up_or_down.zero? ? -1 : +1
    strength = send(skill)

    luck = strength * (rand / 10 ) * flip
    strength + luck
  end
end
