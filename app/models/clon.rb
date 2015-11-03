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

class Clon < ActiveRecord::Base
	belongs_to :game
	belongs_to :person
	has_many :relationships, dependent: :destroy
	has_many :works, through: :relationships

	default_scope -> {order('id')}
	validates :game_id, presence: true
  validates :person_id, presence: true

  def fav_down!(game)
	  self.relationships.each do |p|
	    p.favorability -= (self.person == Person.first)? 10 : 5
	    p.favorability = 0 if p.favorability < 0
	    p.save
			p.destroy if p.favorability == 0 && self.person != Person.first
	  end
		self.alignment(game)
	end

	def alignment(game)
	  self.relationships.map{|p|
			(self.person==Person.first || game.clons.first.relationships.find_by(work_id:p.work_id).nil? || game.clons.first.relationships.find_by(work_id:p.work_id).favorability.nil?)? 0 : p.favorability * game.clons.first.relationships.find_by(work_id:p.work_id).favorability
		}.select{|k| k!=0 }.tap{|s| break [0] if s.empty?}.tap{|s| break s.inject(:+) * (1+ Math.log(s.count)) unless s.empty?}.to_i
	end
end
