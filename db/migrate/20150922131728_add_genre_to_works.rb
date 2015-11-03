class AddGenreToWorks < ActiveRecord::Migration
  def change
    add_column :works, :genre, :integer
  end
end
