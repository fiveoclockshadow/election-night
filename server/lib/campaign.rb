class Campaign < ActiveRecord::Base
  has_many :enrollments
  has_many :candidates, through: :enrollments
  scope :won, -> (id) { where(winning_candidate_id: id) }
  belongs_to :winning_candidate, class_name: 'Candidate', required: true

  validate :validate_number_of_candidates, on: :create

  def validate_number_of_candidates
    errors.add(:candidates, 'must have at least 2') if candidates.size < 2
  end

  def fight!
    self.start_at = Time.now
    self.winning_candidate = winning_candidates_for_each_skill.mode
  end

  private

  def winnner_of_skill(candidates, skill)
    candidates.sort_by do |candidate|
      candidate.skill_in_combat(skill)
    end.first
  end

  def winning_candidates_for_each_skill
    Candidate::CONSIDERING_ATTRIBUTES.map do |skill|
      winnner_of_skill(candidates, skill)
    end
  end
end
