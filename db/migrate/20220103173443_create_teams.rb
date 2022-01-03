class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.column(:name, :string)
      t.column(:team_coordinator, :string)
      t.timestamps()
    end
  end
end
