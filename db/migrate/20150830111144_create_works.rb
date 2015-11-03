class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.text :desc
      t.text :tags

      t.timestamps
    end
  end
end
