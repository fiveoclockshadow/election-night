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
    candidate = Candidate::CONSIDERING_ATTRIBUTES.map do |skill|
      winnner_of_skill candidates, skill
    end.each_with_object(Hash.new(0)) do |winner, acc|
      acc[winner] += 1
    end.max_by { |_winner, count| count }.first
    self.winning_candidate = candidate
  end

  def winnner_of_skill(candidates, skill)
    candidates.sort_by do |candidate|
      candidate.skill_in_combat(skill)
    end.last
  end
end
