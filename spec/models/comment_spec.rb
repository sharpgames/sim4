# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  desc       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
