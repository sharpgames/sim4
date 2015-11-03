# == Schema Information
#
# Table name: relationships
#
#  id           :integer          not null, primary key
#  clon_id      :integer
#  work_id      :integer
#  favorability :integer
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_relationships_on_clon_id              (clon_id)
#  index_relationships_on_clon_id_and_work_id  (clon_id,work_id) UNIQUE
#  index_relationships_on_work_id              (work_id)
#

require 'rails_helper'

RSpec.describe Relationship, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
