Game.all.each do |s|
	s.clons.drop(1).each do |e|
		e.relationships.each do |f|
			f.destroy if f.favorability==0 && s.ended? && e.person != Person.first
		end
	end
end
