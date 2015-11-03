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

require 'rails_helper'

RSpec.describe WatchCard, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
