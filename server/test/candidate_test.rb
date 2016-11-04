require_relative 'test_helper'

class CandidateTest < Minitest::Test
  def test_exists
    assert Candidate
  end

  def trump
    @_trump ||= Candidate.create(
      name: 'Trump',
      image_url: 'http://img.wonkette.com/wp-content/uploads/2016/08/nbc-fires-donald-trump-after-he-calls-mexicans-rapists-and-drug-runners.jpg',
      intelligence: 0,
      charisma: 5,
      willpower: 9
    )
  end

  def test_skill_in_combat_returns_a_value_with_one_tenth_org_value
    in_combat = trump.skill_in_combat(:charisma)
    assert_in_delta in_combat, 5, 1
  end
end
