class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.datetime :start_date, null: false
      t.string :type, null: false
      t.timestamps
    end
  end
end
