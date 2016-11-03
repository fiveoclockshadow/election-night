class Campaign < ActiveRecord::Base
  has_many :enrollments
  has_many :candidates, through: :enrollments
end
