# == Schema Information
#
# Table name: clons
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  person_id  :integer
#  affinity   :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_clons_on_game_id                (game_id)
#  index_clons_on_game_id_and_person_id  (game_id,person_id) UNIQUE
#  index_clons_on_person_id              (person_id)
#

require 'rails_helper'

RSpec.describe Clon, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
