class CreateTournamentTeams < ActiveRecord::Migration[6.0]
  def change
    remove_column :teams, :tournament_id
    create_table :tournament_teams do |t|
      t.references :team, null: false, foreign_key: true
      t.references :tournament, null: false, foreign_key: true
      t.timestamps
    end
    add_index :tournament_teams, [:team_id, :tournament_id], unique: true
  end
end
