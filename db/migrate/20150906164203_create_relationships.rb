class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :clon_id
      t.integer :work_id
      t.integer :favorability

      t.timestamps
    end

		add_index :relationships, :clon_id
		add_index :relationships, :work_id
		add_index :relationships, [:clon_id,:work_id], unique: true
  end
end
