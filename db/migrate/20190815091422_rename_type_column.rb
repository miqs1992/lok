class RenameTypeColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :tournaments, :type, :tournament_type
  end
end
