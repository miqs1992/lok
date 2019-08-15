class CreateShields < ActiveRecord::Migration[6.0]
  def change
    create_table :shields do |t|
      t.references :player, index: true
      t.integer :p1, default: 0, null: false
      t.integer :p2, default: 0, null: false
      t.integer :p3, default: 0, null: false
      t.integer :p4, default: 0, null: false
      t.integer :p5, default: 0, null: false
      t.integer :p6, default: 0, null: false
      t.integer :p7, default: 0, null: false
      t.integer :p8, default: 0, null: false
      t.integer :p9, default: 0, null: false
      t.integer :p10, default: 0, null: false
      t.integer :points, default: 0, null: false, index: true
      t.bigint :binary_points, default: 0, null: false, index: true
      t.timestamps
    end
  end
end
