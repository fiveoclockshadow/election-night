class CreateCandidatesTableMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :image_url
      t.integer :intelligence
      t.integer :charisma
      t.integer :willpower
    end
  end
end
