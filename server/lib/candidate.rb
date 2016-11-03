class Candidate < ActiveRecord::Base
  has_many :enrollments, dependent: :restrict_with_error
  has_many :campaigns, through: :enrollments
end
