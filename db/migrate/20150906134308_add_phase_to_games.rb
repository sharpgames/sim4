class AddPhaseToGames < ActiveRecord::Migration
  def change
    add_column :games, :phase, :integer
  end
end
