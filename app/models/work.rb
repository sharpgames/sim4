# == Schema Information
#
# Table name: works
#
#  id         :integer          not null, primary key
#  name       :string
#  desc       :text
#  tags       :text
#  created_at :datetime
#  updated_at :datetime
#  url        :string
#  year       :integer
#  genre      :integer
#

class Work < ActiveRecord::Base
	VALID_REGED = /\A\S+\z/i
	serialize :tags, Array
	validates :name, presence: true, length: { minimum: 2 },format: {with: VALID_REGED}

	enum genre: %i(anime religion ice)
end
