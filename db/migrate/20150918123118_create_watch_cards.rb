class CreateWatchCards < ActiveRecord::Migration
  def change
    create_table :watch_cards do |t|
      t.integer :game_id
      t.text :work_ids

    end

		add_index :watch_cards, :game_id
		add_index :watch_cards, :work_ids
		add_index :watch_cards, [:game_id,:work_ids], unique: true
  end
end
