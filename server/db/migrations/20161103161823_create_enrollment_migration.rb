class CreateEnrollmentMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.integer :candidate_id
      t.integer :campaign_id
    end
  end
end
