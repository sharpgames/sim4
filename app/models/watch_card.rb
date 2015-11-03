# == Schema Information
#
# Table name: watch_cards
#
#  id       :integer          not null, primary key
#  game_id  :integer
#  work_ids :text
#
# Indexes
#
#  index_watch_cards_on_game_id               (game_id)
#  index_watch_cards_on_game_id_and_work_ids  (game_id,work_ids) UNIQUE
#  index_watch_cards_on_work_ids              (work_ids)
#

class WatchCard < ActiveRecord::Base
	belongs_to :game
	serialize :work_ids, Array

  validates :game_id, presence: true
  validates :work_ids, presence: true,uniqueness: {:scope => :game_id}
end
