# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  score      :integer
#  turn       :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  phase      :integer
#
# Indexes
#
#  index_games_on_user_id_and_created_at  (user_id,created_at)
#

require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
