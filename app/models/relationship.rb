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

class Relationship < ActiveRecord::Base
	belongs_to :clon
	belongs_to :work
	
  validates :clon_id, presence: true
  validates :work_id, presence: true
	validates :favorability, inclusion: { in: 0..100 }
end
