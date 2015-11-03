class CreateClons < ActiveRecord::Migration
  def change
    create_table :clons do |t|
      t.integer :game_id
      t.integer :person_id
      t.integer :affinity

      t.timestamps
    end
		
		add_index :clons, :game_id
		add_index :clons, :person_id
		add_index :clons, [:game_id, :person_id], unique: true
  end
end
