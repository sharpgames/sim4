# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  name       :string
#  tags       :text
#  affinity   :integer
#  created_at :datetime
#  updated_at :datetime
#  fake_name  :string
#

require 'rails_helper'

RSpec.describe Person, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
