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
    self.winning_candidate_id = candidates.to_a.sample.id
  end
end
