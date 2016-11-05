module Fixtures
  def gary
    @_gary ||= Candidate.create!(
      name: 'Gary',
      image_url: 'http://img.wonkette.com/wp-content/uploads/2016/08/nbc-fires-donald-trump-after-he-calls-mexicans-rapists-and-drug-runners.jpg',
      intelligence: 1,
      charisma: 5,
      willpower: 3
    )
  end

  def trump
    @_trump ||= Candidate.create!(
      name: 'Trump',
      image_url: 'http://img.wonkette.com/wp-content/uploads/2016/08/nbc-fires-donald-trump-after-he-calls-mexicans-rapists-and-drug-runners.jpg',
      intelligence: 3,
      charisma: 5,
      willpower: 2
    )
  end

  def trump_with_campaigns
    if instance_variable_defined?(:@_trump_with_campaigns)
      @_trump_with_campaigns
    else
      gary
      trump
      c = Campaign.new(candidates: Candidate.all, start_at: Time.now)
      c.fight!
      c.save!
      @_trump_with_campaigns = trump
    end
  end

  def parsed_response
    @_parsed_response ||= JSON.parse(last_response.body) if last_response.body
  end
end