class AddWinningCandidateIdToCampaignMigration < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :winning_candidate_id, :integer
    add_index  :campaigns, :winning_candidate_id
  end
end
