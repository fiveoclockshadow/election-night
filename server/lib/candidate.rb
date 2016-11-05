# Represent the competitor
class Candidate < ActiveRecord::Base
  has_many :enrollments, dependent: :restrict_with_error
  has_many :campaigns, through: :enrollments

  CONSIDERING_ATTRIBUTES = %w(charisma intelligence willpower).freeze

  validate :validate_max_skill_points
  validates :name, presence: true

  def validate_max_skill_points
    errors.add(:skill_points, "must culmulatively be below #{max_skill_points}") if skill_points > max_skill_points
  end

  def skill_points
    CONSIDERING_ATTRIBUTES.map { |e| send(e).to_i }.sum
  end

  def max_skill_points
    10 + number_of_won_campaigns.to_i
  end

  def number_of_won_campaigns
    return 0 if campaigns.empty?
    campaigns.won(id).count
  end

  def skill_in_combat(skill)
    up_or_down = rand.round
    flip = up_or_down.zero? ? -1 : +1
    strength = send(skill)

    luck = strength * (rand / 10) * flip
    strength + luck
  end
end
