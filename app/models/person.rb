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

class Person < ActiveRecord::Base
	serialize :tags
end
