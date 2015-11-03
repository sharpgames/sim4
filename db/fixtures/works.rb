require 'csv'

csv = CSV.read('db/fixtures/works-ice.csv')
csv.each do |line|
	id = line[0].to_i
	name = line[1]
	genre = "ice"
	desc = line[2]
	next if id == 0
	Work.seed do |s|
		s.id = id
		s.name = name
		s.genre = genre
		s.desc = desc
	end
end

