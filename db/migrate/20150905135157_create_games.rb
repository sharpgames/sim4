class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :score
      t.integer :turn
      t.integer :user_id

      t.timestamps
    end
		add_index :games, [:user_id, :created_at]
  end
end
