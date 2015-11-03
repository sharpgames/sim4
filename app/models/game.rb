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

class Game < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	has_many :clons, dependent: :destroy
	has_many :people, through: :clons
  has_many :watch_cards, dependent: :destroy

  def phase?
  	(self.phase==1)? :mission : :watch
  end

	def ended?
    self.turn >= Settings.last_turn
  end

  def watch_phase(work_ids)
		  self.watch_cards.find(work_ids)[:work_ids].each do |l|
				relation = self.clons.first.relationships.find_by(work_id:l.id) || self.clons.first.relationships.new(work_id:l.id,favorability:0)
				relation.favorability += 20 + self.people.first.tags.map{|h| (relation.work.tags.split("").flatten.include?(h))? 5 : 0}.inject(:+)
				relation.favorability += (Time.now.sec + l.id) % 10
				relation.favorability = 100 if relation.favorability > 100
				relation.save
		  end

		  wcd = self.watch_cards.find(work_ids)
			wcd.work_ids = self.clons.first.relationships.shuffle[0..2].sort.map{|s| s.work}
      until wcd.save do
			  wcd.work_ids = self.clons.first.relationships.shuffle[0..2].sort.map{|s| s.work}
			end

			self.phase = 1
			self.save
  end

  def mission_phase(t)
				relation = self.clons.find_by(person_id:t[:person_id]).relationships.find_or_create_by(work_id:t[:work_id])
				relation.favorability = 0 if relation.favorability.nil?
				if Random.rand(1 .. 110) < self.clons.first.relationships.find_by(work_id:t[:work_id]).favorability
					af =self.clons.find_by(person_id:t[:person_id])
					af.affinity = 0 if af.affinity.nil?
					af.affinity += 2
					af.save
				  relation.favorability += 0.5 * self.clons.first.relationships.find_by(work_id:t[:work_id]).favorability + self.people.find_by_id(t[:person_id]).tags.map{|h| (relation.work.tags.split("").flatten.include?(h))? 5 : 0}.inject(:+)
					relation.favorability += af.affinity
				  relation.favorability = 100 if relation.favorability > 100
				  relation.save
				  msg = '布教に成功しました。'
					err = 0
				else
				  msg = '布教に失敗しました。'
          err = 1
				end
			# Favorability Down and calculate score.
			self.score = self.clons.map{|p| p.fav_down!(self)}.inject(&:+) 
			
			self.phase = 0
			self.turn += 1
			self.save
	msg
	end

	def rescore
			self.score = self.clons.map{|p| p.alignment(self)}.inject(&:+) 
			self.save
	end
end
