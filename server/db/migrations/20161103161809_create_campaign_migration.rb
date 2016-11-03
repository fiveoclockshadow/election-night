class CreateCampaignMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.datetime :start_at
    end
  end
end
