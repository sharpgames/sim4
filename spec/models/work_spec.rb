# == Schema Information
#
# Table name: works
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :text
#  tags       :text
#  created_at :datetime
#  updated_at :datetime
#  url        :string(255)
#  year       :integer
#  genre      :integer
#

require 'rails_helper'

RSpec.describe Work, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
