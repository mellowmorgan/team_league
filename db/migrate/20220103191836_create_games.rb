class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.column(:team_1_id, :integer)
      t.column(:team_2_id, :integer)
      t.column(:team_1_score, :integer)
      t.column(:team_2_score, :integer)
      t.timestamps
    end
  end
end
