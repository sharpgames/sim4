class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.text :tags
      t.integer :affinity

      t.timestamps
    end
  end
end
