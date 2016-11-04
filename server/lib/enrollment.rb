class Enrollment < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :candidate
end
