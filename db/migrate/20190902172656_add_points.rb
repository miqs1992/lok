class AddPoints < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :points, :integer, default: 0, null: false
    add_column :players, :binary_points, :bigint, default: 0, null: false
    add_column :teams, :points, :integer, default: 0, null: false
    add_column :teams, :binary_points, :bigint, default: 0, null: false

    add_index :players, :points
    add_index :players, :binary_points
    add_index :teams, :points
    add_index :teams, :binary_points
  end
end
